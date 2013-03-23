alias htop="htop --sort-key PERCENT_CPU"
alias df="df -h"
alias du="du -h"
alias lh="ls -lh .[a-zA-Z0-9]*"
alias ll="ls -lh"
alias lla="ls -lha"
alias ls="ls -lFGh"
alias mkdir="mkdir -p"
alias mv="mv -i"
#alias path="env | grep PATH"
#alias pcd="cd -"
alias ps="ps aux"
alias rm="rm -i"
alias vi="mvim"
alias vim="mvim"
alias ff="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
alias pandora="pianobar"
alias hsplit="split_tab"
alias vsplit="split_tab"

alias f='open -a Finder '

alias guard='bundle exec guard start -i'

alias HEX="ruby -e 'printf(\"0x%X\n\", ARGV[0])'"
alias DEC="ruby -e 'printf(\"%d\n\", ARGV[0])'"
alias BIN="ruby -e 'printf(\"%bb\n\", ARGV[0])'"
alias WORD="ruby -e 'printf(\"0x%04X\n\", ARGV[0])'"

alias prettyjson="python -mjson.tool"


# Get readable list of network IPs
#alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="jsonip.rb"
alias flush="dscacheutil -flushcache" # Flush DNS cache
