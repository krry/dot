function fizzbuzz
    for i in (seq $argv)
        set -e buff
        if test (math $i % 3) = 0
            set buff $buff 'fizz'
        end
        if test (math $i % 5) = 0
            set buff $buff 'buzz'
        end
        if test -z "$buff"
            set buff $i
        end
        sleep 0.1
        echo $buff
    end
end
