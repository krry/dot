
if status --is-interactive
# load all saved ssh keys
	/usr/bin/ssh-add -A ^/dev/null

# wipe the paths to prevent dupes
	set -ge fish_user_paths

# spill some brew in the path
	set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths
	set -g fish_user_paths "/opt/homebrew/sbin" $fish_user_paths

# initiate jump sequence; fire z missile
	source (jump shell --bind=z fish | psub)

# export IP address to the env
	set -gx EDITOR 'code'

# make IP available to shell
	set -x IP (ipconfig getifaddr en0)

# let node find the path
	set -ga fish_user_paths (nvm current)

# drop some rubies
	source (rbenv init -|psub)

# aliases
	source $HOME/.config/fish/alias.fish
	source $HOME/.iterm2_shell_integration.(basename $SHELL)

# hook direnv in
	eval (direnv hook fish) > /dev/null

# launch starship promptly
	starship init fish | source

# get fish all vimmy
	fish_vi_key_bindings

	if not set -q VIMRUNTIME
		set fish_greeting
		Kamadhenu
	end
end
