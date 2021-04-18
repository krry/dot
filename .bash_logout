# clear console when logging out if possible
if [ "$SHLVL" = 1 ] ; then
	clear_console -q 2>/dev/null
fi
