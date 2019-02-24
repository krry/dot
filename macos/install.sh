# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

echo "Shall we run a mac OS software update?"
read -p "(y/n): " -n1 REPLY
if [[ $REPLY =~ ^[Yy]$ ]] ; then
  echo "Checking for Mac OS software update."
  echo "Please enter the password for this machine:"
  sudo softwareupdate -i -a
else
  echo "Ok. Continuing without updating Mac OS..."
fi
