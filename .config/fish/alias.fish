# apps... but better
alias git=hub
# alias vim=nvim
alias ls=exa
alias find=fd
alias cat=bat

# git
abbr -a gs   git status -sb
abbr -a gst  git status
abbr -a ga   git add
abbr -a gad  git add .
abbr -a gb   git branch
abbr -a gbm  git branch -m
abbr -a gbd  git branch -d
abbr -a gbD  git branch -D
abbr -a gac  git commit -a --verbose
abbr -a gc   git commit
abbr -a gcm  git commit -m
abbr -a gcam git commit -am
abbr -a gca  git commit --amend
abbr -a gcv  git commit --verbose
abbr -a gcl  git clone
abbr -a gco  git checkout
abbr -a gp   git push
abbr -a gpl  git pull
abbr -a gl   git log
abbr -a gd   git diff
abbr -a gds  git diff --staged
abbr -a grb  git rebase -i HEAD~15
abbr -a grs  git reset --soft
abbr -a grhh git reset --hard HEAD
abbr -a gf   git fetch
abbr -a gfc  git findcommit
abbr -a gfm  git findmessage

# yadm
abbr -a ys  yadm status -s -b
abbr -a ya  yadm add
abbr -a yc  yadm commit
abbr -a ycm yadm commit -m
abbr -a yp  yadm push
abbr -a yl  yadm l
abbr -a yd  yadm diff
abbr -a yds yadm diff --staged

# yarn & npm
abbr -a yrd yarn dev
abbr -a nrd npm run dev
abbr -a npi npm install
abbr -a yad yarn add

# homebrew
abbr -a bri brew install
abbr -a bru brew uninstall
abbr -a bruu 'brew update && brew upgrade'

# ls
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias cpr='cp -r'

# misc
alias reload='exec fish'
alias refish='exec fish'

abbr -a h history

# cds
abbr -a ccd cd $HOME/Code
abbr -a dls cd $HOME/Downloads
abbr -a scz cd $HOME/Desktop/Screenshots

# code workspaces
abbr -a dot code $HOME/Code/dot
abbr -a smn code $HOME/Code/summon
abbr -a atma code $HOME/Code/krry/atmanautica.com
abbr -a cmnplc code $HOME/Code/krry/commonplace
abbr -a confish code $HOME/.config/fish
