set -g fish_greeting ''

set -x EDITOR (which vim)
set -x NODE_PATH /usr/local/lib/node_modules
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/share/npm/bin $PATH
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/bin $PATH
set -x RUBYGEMS_EC2_DB1 ec2-54-245-133-190.us-west-2.compute.amazonaws.com
set -x RUBYGEMS_EC2_LB1 54.245.255.174
set -x GOPATH $HOME/workspace/go
set -x -U GOBIN $GOPATH/bin
set -x PATH $GOBIN $PATH
status --is-interactive; and . (rbenv init -|psub)

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

source ~/.config/fish/nvm-wrapper/nvm.fish
