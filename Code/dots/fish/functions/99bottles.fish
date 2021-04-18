function 99bottles
    if string match -qr '^[0-9]+$' $argv
        if test $argv -lt 10
            set guzzledelay $argv
        end
    else
        set guzzledelay 0.125
    end
    for quant in (seq 99 -1 1)
        if test "$quant -gt 1" >/dev/null
            echo -e "$quant bottles of beer on the wall,\n$quant bottles of beer."
            if test "$quant -gt 2" >/dev/null
                set suffix (math "$quant - 1")
                set suffix "$suffix bottles of beer on the wall."
            else
                set suffix "1 bottle of beer on the wall."
            end
        else if test "$quant -eq 1" >/dev/null
            echo -e "1 bottle of beer on the wall, 1 bottle of beer."
            set suffix "no more beer on the wall!"
        end
        echo -e "Take one down, pass it around,\n$suffix"
        sleep $guzzledelay
        echo -e "--"
    end
    echo "CHEERS!"
end
