function mkdir --description 'Create a directory and change to it'
	command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

        case '*'
            cd $argv[(count $argv)]
            return
        end
    end
end
