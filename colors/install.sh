#!/usr/bin/env bash

# install colors

import_iterm_cfg() {
    # Specify the preferences directory
    defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/.itermcfg/"
    # Tell iTerm2 to use the custom preferences in the directory
    defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
    if [[ $? -eq 0 ]]
    then
        success "Configured iTerm2 to load the custom preferences"
    else
        failure "Unable to apply iTerm2 preferences" >&2
    fi
}

import_iterm_cfg
