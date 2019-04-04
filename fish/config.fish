if status --is-interactive
    set PATH /usr/local/bin
    set PATH $PATH /usr/bin
    set PATH $PATH /bin
    set PATH $PATH /usr/sbin
    set PATH $PATH /sbin
    set PATH $PATH /opt/X11/bin
    set PATH $PATH /usr/local/MacGPG2/bin
    set PATH $PATH /Library/TeX/texbin
    set PATH $PATH .
    set PATH $PATH (gem env GEM_PATHS)
    set PATH $PATH (go env GOROOT)/bin
    set PATH $PATH (go env GOPATH)/bin
    set PATH $PATH $HOME/.cargo/bin
    kamadhenu
end

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish