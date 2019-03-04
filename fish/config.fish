# add golang binaries to PATH
set -x PATH $PATH (go env GOPATH)/bin (go env GOROOT)/bin

# add ruby gems to PATH
set -x PATH $PATH (gem env GEM_PATHS)

# add cargo crates to PATH
set -x PATH $PATH $HOME/.cargo/bin

if status --is-interactive
    kamadhenu
end
