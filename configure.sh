#!/bin/bash

# Install brew
if test ! $(which brew) ; then
  echo "Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin" ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

fi

echo "Updating package lists..."
brew update

# zsh install
if test $(which zsh) ; then
  echo "zsh already installed..."
else
  echo "zsh not found, now installing zsh..."

  brew install zsh zsh-completions
  chsh -s /usr/local/bin/zsh
fi

# Installing git completion
echo "Now installing git and bash-completion..."

brew install git && brew install bash-completion

echo "Now configuring git-completion..."

GIT_VERSION=`git --version | awk '{print $3}'`
URL="https://raw.github.com/git/git/v$GIT_VERSION/contrib/completion/git-completion.bash"

echo "Downloading git-completion for git version: $GIT_VERSION..."

if ! curl "$URL" --silent --output "$HOME/.git-completion.bash" ; then
  echo "ERROR: Couldn't download completion script. Make sure you have a working internet connection." && exit 1
fi

# prezto zsh install
if [ -d ~/.zprezto/ ] ; then
  echo "prezto is already installed..."
  read -p "Would you like to update prezto now?" -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]] ; then
    zprezto-update
  fi
else
  git clone --recursive https://github.com/krry/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

# Pull down personal dotfiles
read -p "Do you want to use krry's dotfiles? y/n" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]] ; then
  if [[ -d ~/.dotfiles ]] ; then
    read -p "dotfiles already present. do you want to reinstall? y/n" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]] ; then
      echo "archiving old dotfiles in ~/.dotfiles_old"
      mv -r "$HOME/.dotfiles" "$HOME/.dotfiles_old"
    fi
  fi

  echo "Now pulling down krry's dotfiles..."

  git clone https://github.com/krry/dot.git ~/.dotfiles
  cd $HOME/.dotfiles && echo "switched to .dotfiles dir..."

  echo "Checking out mac branch..." && git checkout mac
  echo "Now configuring symlinks..." && $HOME/.dotfiles/script/bootstrap

  if [[ $? -eq 0 ]]; then
    echo "Successfully configured your environment with krry's mac dotfiles..."
  else
    echo "krry's mac dotfiles were not applied successfully..." >&2
  fi

else
  echo "You chose not to apply krry's macOS dotfiles."
  echo "You may need to configure your environment manually..."
  echo "Setting defaults for .zshrc and .bashrc..."
  echo "source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc && echo "added zsh-syntax-highlighting to .zshrc..."
  echo "source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc && echo "added zsh-autosuggestions to .zshrc..."
  echo "source $HOME/.git-completion.bash" >> ${ZDOTDIR:-$HOME}/.bashrc && echo "added git-completion to .bashrc..."
fi

