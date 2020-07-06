if status --is-interactive
    set PATH /usr/local/bin
    set PATH $PATH /usr/local/sbin
    set PATH $PATH /usr/bin
    set PATH $PATH /bin
    set PATH $PATH /usr/sbin
    set PATH $PATH /sbin
    set PATH $PATH /opt/X11/bin
    set PATH $PATH /usr/local/MacGPG2/bin
    set PATH $PATH /Library/TeX/texbin
    set PATH $PATH .
    set PATH $PATH (gem env GEM_PATHS)/bin
    set PATH $PATH /Users/alan/.gem/ruby/2.7.0/bin
    set PATH $PATH (go env GOROOT)/bin
    set PATH $PATH (go env GOPATH)/bin
    set PATH $PATH $HOME/.cargo/bin
    set PATH $PATH $HOME/flutter/bin
    set IP (ipconfig getifaddr en0)
    source (rbenv init -|psub)
    daymode
    Kamadhenu
end
