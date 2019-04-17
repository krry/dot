function vim
    if daymode
        set theme 'light'
    else
        set theme 'dark'
    end
	nvim --cmd "let theme=$theme" $argv
end
