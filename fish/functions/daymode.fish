function daymode
    if [ $argv ]
        set mode $argv
    else
        set mode 'dark'
    end

    set current (date '+%H')

    if test $current -gt 7; and test $current -lt 19; or [ $mode = "light" ]
        echo -e "\033]50;SetProfile=Daymode\a"
        set -xg THEME 'light'
    else
        echo -e "\033]50;SetProfile=Devmo\a"
        set -xg THEME 'dark'
    end
end
