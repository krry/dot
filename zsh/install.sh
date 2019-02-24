# prezto zsh install
if [ -d ~/.zprezto/ ] ; then
  echo "prezto is already installed."
  vared -cp "Would you like to update prezto now?" REPLY
  if [[ $REPLY =~ ^[Yy]$ ]] ; then
    zprezto-update
  fi
else
  echo "installing prezto for zsh..."
  git clone -q --recursive https://github.com/krry/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi
