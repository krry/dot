
if status --is-interactive
# load all saved ssh keys
	/usr/bin/ssh-add -A ^/dev/null

# wipe the paths to prevent dupes
	set -ge fish_user_paths

# export IP address to the env
	set -gx EDITOR 'code'

# make IP available to shell
	set -x IP (ipconfig getifaddr en0)

# let the yarns spin
	# set -ga fish_user_paths (yarn global bin)

# spill some brew in the path
	set -g fish_user_paths /opt/homebrew/bin $fish_user_paths
	set -g fish_user_paths /opt/homebrew/sbin $fish_user_paths

# ready for anyenv now: rbenv nodenv pyenv
	source (anyenv init -|psub)

# initiate jump sequence; fire z missile
	source (jump shell --bind=z fish | psub)

# switch to modern python
	set -ga fish_user_paths "/Library/Frameworks/Python.framework/Versions/3.9/bin"

# add brew ruby gems to path
	set -g fish_user_paths "/opt/homebrew/opt/ruby/bin" $fish_user_paths
  set -ga fish_user_paths "/opt/homebrew/lib/ruby/gems/3.0.0/bin"

# aliases
	source $HOME/.config/fish/alias.fish
	source $HOME/.iterm2_shell_integration.(basename $SHELL)

# hook direnv in
	eval (direnv hook fish) > /dev/null

# launch starship promptly
	starship init fish | source

# get fish all vimmy
	# fish_vi_key_bindings

	if not set -q VIMRUNTIME
		set fish_greeting
		neofetch
		Kamadhenu
	end
end

set -g fish_user_paths "/opt/homebrew/opt/openssl@1.1/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
