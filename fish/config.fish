set -g fish_greeting ''

set -x EDITOR (which vi)
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH $HOME/bin $PATH

# npm
if test -d /usr/local/lib/node_modules
  set -x NODE_PATH /usr/local/lib/node_modules
end

if test -d /usr/local/share/npm/bin
  set -x PATH /usr/local/share/npm/bin $PATH
end

# go
if test -d $HOME/workspace/go
  set -x GOPATH $HOME/workspace/go
  set -x -U GOBIN $GOPATH/bin
  set -x PATH $GOBIN $PATH
end

# rbenv
if type -q rbenv
  set -x PATH $HOME/.rbenv/bin $PATH
  set -x PATH $HOME/.rbenv/shims $PATH
  status --is-interactive; and . (rbenv init -|psub)
end

#nvm
if type -q nvm
  source ~/.config/fish/nvm-wrapper/nvm.fish
end

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias numfiles='echo (ls -1 | wc -l)'
alias qfind="find . -name "
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# create a temporary dir and cd to it
alias cdtemp='cd (mktemp -d /tmp/tmpd.(date +%s).XXX)'
alias cdlasttemp='cd (ls -d /tmp/tmpd* | tail -n1)'
