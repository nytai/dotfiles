set -g fish_greeting ''

set -x EDITOR (which vi)
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/opt/bin $PATH
set -x PATH $HOME/bin $PATH
set -x NVM_DIR $HOME/.nvm

# npm
if test -d /usr/local/lib/node_modules
  set -x NODE_PATH /usr/local/lib/node_modules
end

if test -d /usr/local/share/npm/bin
  set -x PATH /usr/local/share/npm/bin $PATH
end

# go
if type -q go
  set -x GOPATH (go env GOPATH)
  set -x -U GOBIN $GOPATH/bin
  set -x PATH $GOBIN $PATH
end

# rbenv
if type -q rbenv
  set -x PATH $HOME/.rbenv/bin $PATH
  set -x PATH $HOME/.rbenv/shims $PATH
  status --is-interactive; and . (rbenv init -|psub)
end

if type -q pyenv
 status is-interactive; and pyenv init --path | source
 pyenv init - | source
end

# nvim is busted
if type -q nvim
  alias vim='nvim'
  set -x EDITOR (which nvim)
end

# k9s completion
if type -q k9s
  k9s completion fish | source
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
alias edit='vim'                            # edit:         Opens any file in sublime editor
alias numfiles='echo (ls -1 | wc -l)'
alias qfind="find . -name "
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias kc=kubectl

# aliases for modern unix https://github.com/ibraheemdev/modern-unix
alias cat='bat'
alias ll='ls -la'
alias grep='rg'
alias ack='ag'
alias curl='curlie'
alias find='fd'
alias man='tldr'

# create a temporary dir and cd to it
alias cdtemp='cd (mktemp -d /tmp/tmpd.(date +%s).XXX)'
alias cdlasttemp='cd (ls -d /tmp/tmpd* | tail -n1)'
direnv hook fish | source

thefuck --alias | source

__check_nvm

starship init fish | source

set -gx PATH $PATH $HOME/bin

set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/applejdk-17.0.4.8.1.jdk/Contents/Home

