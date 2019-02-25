#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

echo "Check for Homebrew"
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi
fi

# Run Homebrew through the Brewfile
cat << EOF
We're ready to install the homebrew bundle.
This could take a while.

Do you want to do this now?
EOF
echo ''
read -p "(y/n): " -n 1
echo ''
if [[ $REPLY =~ ^[Yy]$ ]] ; then
  brew bundle
else
  echo "Ok. You can always come back and run \`brew bundle\` later."
fi

exit 0
