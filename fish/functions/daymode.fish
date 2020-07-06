function daymode
    if [ $argv[1] ]
        set mode $argv[1]
        if test $mode = "light"; or test $mode = "on"
            lightup
        else if test $mode = "dark"; or test $mode = "off"
            godark
        end
        return 0
    end

    set current (date '+%H')

    if test $current -gt 7; and test $current -lt 19
        lightup
    else
        godark
    end
end

function lightup
    echo -e "\033]50;SetProfile=Daymode\a"
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to no'
    set -xg THEME 'light'
    echo "🌞 daymode activated 😎"
end

function godark
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to yes'
    echo -e "\033]50;SetProfile=Devmo\a"
    set -xg THEME 'dark'
    echo "🌚 nightmode triggered ✨"
end

alias nightmode godark
