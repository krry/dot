#!/usr/bin/env bash
#
# bootstrap.sh
#
# configures bash, git, vim, tmux, fish on a Mojave Mac
#


########## parameters ##########

AUTHOR=krry
APP_NAME='dot'

[ -z "$APP_PATH" ] && APP_PATH="$HOME/.${APP_NAME}"
[ -z "$REPO_URI" ] && REPO_URI="https://github.com/${AUTHOR}/${APP_NAME}.git"

[ -z "$VIMRC" ] && VIMRC="$HOME/.config/nvim/init.vim"
[ -z "$NVIM_PATH" ] && NVIM_PATH="$HOME/.local/share/nvim"

HOMEBREW_PREFIX=$(brew --prefix)

########## tools ##########

message () {
  printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

warning () {
  printf "\r  [ \033[00;33mN.B.\033[0m ] %s\n" "$1"
}

request () {
  printf "\r  [ \033[0;36m??\033[0m ] %s\n" "$1"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

failure () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n" "$1"
  exit
}


########### FUNCTIONS ############

have_homebrew() {
    if ! type -f brew && [[ "$OSTYPE" == "darwin"* ]]; then
        message 'Installing homebrew...'
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        message "Updating homebrew..."
        brew update
    fi
}

setup_git_in_bash() {
    brew install git bash-completion
    GIT_VERSION=$(git --version | awk '{print $3}')
    for i in "${@}"; do
        message "Downloading ${i}@v${GIT_VERSION}..."
        URL="https://raw.githubusercontent.com/git/git/v$GIT_VERSION/contrib/completion/${i}"
        (curl "$URL" --silent --output "$HOME/.${i}") || failure "Couldn't download ${i} script."
    done
}

back_up() {
    if [[ -d $1 ]] ; then
        warning "Older install found"
        now=$(date +%Y%m%d_%s)
        message "Backing up older install in ${1}_${now}"
        mv "$1" "${1}_${now}"
    fi
}

import_submodules() {
    message "importing submodules"
    git submodule init
    git submodule update --remote
}

sync_repo() {
    message "cloning $1 to $2"
    git clone "$1" "$2"
    if "$3"; then cd "$2" && import_submodules; fi
}

setup_gitconfig () {
    if ! [ -f "${APP_PATH}/git/gitconfig.local.symlink" ]
    then
        message 'setup system .gitconfig'

        git_credential='cache'

        if [ "$(uname -s)" == "Darwin" ]
        then
            git_credential='osxkeychain'
        fi

        request ' - What are your Github author credentials?'
        read -rep "Name: " git_authorname
        read -rep "Email: " git_authoremail

        sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" "${APP_PATH}/git/gitconfig.local.symlink.example" > "${APP_PATH}/git/gitconfig.local.symlink"

        success '.gitconfig configured'
    fi
}

link_file () {
    local src=$1 dst=$2

    local overwrite='' backup='' skip=''
    local action=''

    if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]
    then

        if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
        then

            local currentSrc
            currentSrc="$(readlink "$dst")"

            if [ "$currentSrc" == "$src" ]
            then

                skip=true;

            else

                request "File already exists: $dst ($(basename "$src"))\nWhat to do?\n\
                    [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read -rn 1 action

                case "$action" in
                    o )
                        overwrite=true;;
                    O )
                        overwrite_all=true;;
                    b )
                        backup=true;;
                    B )
                        backup_all=true;;
                    s )
                        skip=true;;
                    S )
                        skip_all=true;;
                    * )
                        ;;
                esac

            fi

        fi

        overwrite=${overwrite:-$overwrite_all}
        backup=${backup:-$backup_all}
        skip=${skip:-$skip_all}

        if [ "$overwrite" == "true" ]
        then
            rm "$dst"
            success "removed $dst"
        fi

        if [ "$backup" == "true" ]
        then
            mv "$dst" "${dst}.backup"
            success "moved $dst to ${dst}.backup"
        fi

        if [ "$skip" == "true" ]
        then
            success "skipped $src"
        fi
    fi

    if [ "$skip" != "true" ]  # "false" or empty
    then
        ln -s "$1" "$2"
        success "linked $1 to $2"
    fi
}

install_dotfiles () {
    message 'Installing dotfiles'

    local overwrite_all=false backup_all=false skip_all=false

    find -H "$APP_PATH" -maxdepth 2 -name '*.symlink' -not -path '*.git*' | \
    while read src ; do
        dst="$HOME/.$(basename "${src%.*}")"
        link_file "$src" "$dst"
    done
}

set_mac_defaults() {
    message "This computer is named :$1. Change it?"
    read -rep "$1"
    ./macos/set-default.sh "$REPLY"
}

install_deps() {
    for i in "$@" ; do
        message "Installing $i"
        # shellcheck source=./fonts/install.sh
        . "${APP_PATH}/${i}/install.sh"
        success "$i installed"
    done
}

linkup_nvim() {
    ln -s "$APP_PATH/nvim/init.vim" "$VIMRC"
    for dir in "$@" ; do
        ln -s "$APP_PATH/nvim/$dir/" "$NVIM_PATH"
    done
}

install_plugins() {

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    local system_shell="$SHELL"
    export SHELL='/bin/sh'


    nvim \
        -u "$1" \
        "+set nomore" \
        "+PlugInstall!" \
        "+PlugClean" \
        "+qall"

    export SHELL="$system_shell"

    success "Installing plugins"
}

ask() {
    request "$1"
    read -rp "(y/n): " -n1
    echo ''
    if [[ $REPLY =~ ^[Yy] ]] ; then
        "$2" "$3"
    else
        message "That's ok. Maybe later."
    fi
}

default_fish() {
    sudo chsh -s "$HOMEBREW_PREFIX/fish"
    echo "$HOMEBREW_PREFIX/fish" | sudo tee -a /etc/shells
    message "Installing Oh My Fish in a subshell"
}


# CALLS
cat << EOF

^^^^^^^^^^^^^^^^^^^^
READY FOR .LIFTOFF!?
Yo tambien, $OSTYPE.
Let's get .filed up!
~~~~~~~~~~~~~~~~~~~~

EOF

setup_git_in_bash "git-completion.bash" "git-prompt.sh"
back_up "$APP_PATH"
back_up "$NVIM_PATH"
back_up "$VIMRC"
sync_repo "$REPO_URI" "$APP_PATH" true
setup_gitconfig
install_dotfiles
ask set_mac_defaults "Scrub MacOS defaults?" "$HOSTNAME"
install_deps "fonts" "colors"
linkup_nvim "config" "ftplugin" "plugins"
install_plugins "$APP_PATH/config/bundles.vim"
ask default_fish "Fish as default shell?"

cat << EOF

$&%#&%$&#$&%&#$&%&#$&%&#$&%&%#&#$&%&#$&#$&%&#$&#$&%#&*#%&#%&#%&#%&#

WAHOOOOO!!! We did it!

We're probably all feeling a bit dotty by now.

To test everything out, launch \`iTerm\`, then:
exec fish
tmux a -t devmo
nvim ~/.dot

Dev on!
💓 krry

$&%#&%$&#$&%&#$&%&#$&%&#$&%&%#&#$&%&#$&#$&%&#$&#$&%#&*#%&#%&#%&#%&#
EOF
exit 0

