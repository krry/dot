function daymode
    set current (date '+%H')
    if test $current -gt 7 && test $current -lt 19
        echo 'daymode activated'
        set theme 'light'
    else
        echo 'nightmode activated'
        set theme 'dark'
    end
end
