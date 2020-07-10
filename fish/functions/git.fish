function gst
	git status
end

function gs
	git status -sb
end

function gp
	git push
end

function gl
	git pull
end

function gd
	git diff
end

function gcv
	git commit --verbose
end

function gco
	git checkout $argv
end

function gcm
	git commit -m $argv
end

function gcam
	git commit -am $argv
end

function gad
    git add .
end

function gac
	git add . && git commit --verbose
end
