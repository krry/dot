#!/usr/bin/env bash
#
# bootstrap.sh
#
# configures bash, git, vim, tmux, fish on a Mojave Mac
#


########## parameters ##########

author=krry
app_name='dot'
[ -z "$APP_PATH" ] && APP_PATH="$HOME/.${app_name}"
[ -z "$REPO_URI" ] && REPO_URI="https://github.com/${author}/${app_name}.git"

[ -z "$VIMRC" ] && VIMRC="$HOME/.vimrc"
[ -z "$VIM_PATH" ] && VIM_PATH="$HOME/.vim"

[ -z "$VUNDLE_PATH" ] && VUNDLE_PATH="$VIM_PATH/bundle/vundle"
[ -z "$VUNDLE_URI" ] && VUNDLE_URI="https://github.com/gmarik/vundle.git"

########## tools ##########

msg () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

warn () {
  printf "\r  [ \033[00;33mN.B.\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;36m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

failure () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  exit
}


########### FUNCTIONS ############

have_homebrew() {
    if ! type -f brew && [[ "$OSTYPE" == "darwin"* ]]; then
        msg 'Installing homebrew...'
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        msg "Updating homebrew..."
        brew update
    fi
}

setup_git_in_bash() {

    brew install git bash-completion
    
    GIT_VERSION=`git --version | awk '{print $3}'`
    
    for i in $@; do
        msg "Downloading ${1}@v${GIT_VERSION}..."
        URL="https://raw.githubusercontent.com/git/git/v$GIT_VERSION/contrib/completion/${i}"
        $(curl "$URL" --silent --output "$HOME/.${i}") || failure "Couldn't download ${i} script."
    done
}

back_up() {
    if [[ -d $1 ]] ; then
        warn "Older install found"
        now=`date +%Y%m%d_%s`
        msg "Backing up older install in ${1}_${now}"
        mv "$1" "${1}_${now}"
    fi
}

import_submodules() {
    msg "importing submodules"
    git submodule init
    git submodule update --remote
}

sync_repo() {
    msg "cloning $1 to $2"
    git clone $1 $2
    if $3; then cd $2 && import_submodules; fi
}

setup_gitconfig () {
    if ! [ -f ${APP_PATH}/git/gitconfig.local.symlink ]
    then
        msg 'setup system .gitconfig'

        git_credential='cache'

        if [ "$(uname -s)" == "Darwin" ]
        then
            git_credential='osxkeychain'
        fi

        user ' - What are your Github author credentials?'
        read -ep "Name: " git_authorname
        read -ep "Email: " git_authoremail

        sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" ${APP_PATH}/git/gitconfig.local.symlink.example > ${APP_PATH}/git/gitconfig.local.symlink

        success '.gitconfig configured'
    fi
}

link_file () {
    local src=$1 dst=$2

    local overwrite= backup= skip=
    local action=

    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
    then

        if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
        then

            local currentSrc="$(readlink $dst)"

            if [ "$currentSrc" == "$src" ]
            then

                skip=true;

            else

                user "File already exists: $dst ($(basename "$src"))\nWhat to do?\n\
                    [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read -n 1 action

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
    msg 'Installing dotfiles'

    local overwrite_all=false backup_all=false skip_all=false

    for src in $(find -H "$APP_PATH" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
    do
        dst="$HOME/.$(basename "${src%.*}")"
        link_file "$src" "$dst"
    done
}

set_mac_defaults() {
    msg "This computer is named :$1. Change it?"
    read -e -p "$1"
    ./macos/set-default.sh $REPLY
}

install_deps() {
    for i in $@; do
        msg "Installing $i"
        . "${APP_PATH}/${i}/install.sh"
        success "$i installed"
    done
}

setup_vundle() {

    local system_shell="$SHELL"
    export SHELL='/bin/sh'


    vim \
        -u "$1" \
        "+set nomore" \
        "+BundleInstall!" \
        "+BundleClean" \
        "+qall"

    export SHELL="$system_shell"

    success "Installing vim plugins via Vundle..."
}

ask() {
    user $1
    read -p "(y/n): " -n1
    echo ''
    if [[ $REPLY =~ '^[Yy]' ]] ; then
        $2 $3
    else
        msg "That's ok. Maybe later."
    fi
}

default_fish() {
    sudo chsh -s $HOMEBREW_PREFIX/fish
    echo $HOMEBREW_PREFIX/fish | sudo tee -a /etc/shells
    msg "Installing Oh My Fish in a subshell"
    ( curl -L https://get.oh-my.fish | fish )
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
back_up $APP_PATH
back_up $VIM_PATH
back_up $VIMRC
sync_repo $REPO_URI $APP_PATH true
setup_gitconfig
install_dotfiles
ask set_mac_defaults "Scrub MacOS defaults?" $hostname
install_dep "fonts" "colors"
sync_repo $VUNDLE_URI $VUNDLE_PATH
setup_vundle "$APP_PATH/vimrc.bundles.symlink"
ask default_fish "Fish as default shell?"

cat << EOF

$&%#&%$&#$&%&#$&%&#$&%&#$&%&%#&#$&%&#$&#$&%&#$&#$&%#&*#%&#%&#%&#%&#

I think we're all feeling a bit dotty now.

To test everything out launch \`iTerm\`,
which will load \`fish\` as your shell,
which will attach to a \`tmux\` session,
which will open \`vim\` to ~/.dotfiles.

Try \`omf help\` to activate Oh My Fish!
Oh, and fish uses \`help\` instead of man.

Dev on!
💓 krry

$&%#&%$&#$&%&#$&%&#$&%&#$&%&%#&#$&%&#$&#$&%&#$&#$&%#&*#%&#%&#%&#%&#
EOF
exit 0

