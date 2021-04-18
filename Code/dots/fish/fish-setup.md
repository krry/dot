# Fish Shell Setup

The config for fish lives at `$XDG_CONFIG_HOME`
which defaults to `~/.config/fish` on `*nix`

We want to check whether the shell is interactive before we start setting anything.

```fish
if status --is-interactive
	echo "shell is interactive"
end
```

We will also want `starship` as a prompt, which is shell agnostic.
```fish
brew install starship
```

And [fisher](https://github.com/jorgebucaran/fisher) to manage our fish packages
```fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

Then we can use fisher to install a few key utilities:
```fish
fisher install edc/bass # use bash scripts in fish
\ laughedelic/pisces # for completion of pairs
\ FabioAntunes/fish-nvm # nvm in fish
```

Aliases in fish are better written as functions.
Functions kept at `~/.config/fish/functions` are automatically included.
