alias htop="sudo htop --sort-key PERCENT_CPU"
alias df="df -h"
alias du="du -h"
alias lh="ls -lh .[a-zA-Z0-9]*"
alias ll="ls -lh"
alias lla="ls -lha"
alias ls="ls -lFh -color"
alias lsd="ls -ld"
alias lsold="ls -At1 && echo '------Oldest--'"
alias lsnew='ls -Art1 && echo "------Newest--"'
alias mkdir="mkdir -p"
alias mv="mv -i"
#alias path="env | grep PATH"
#alias pcd="cd -"
alias ps="ps aux"
alias rm="rm -i"
alias ff="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
alias pandora="pianobar"
alias hsplit="split_tab"
alias vsplit="split_tab"
alias weather="ansiweather"

#---
# begin http://brettterpstra.com/2013/03/31/a-few-more-of-my-favorite-shell-aliases/

# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

# DNS (with update thanks to @blanco)
alias flush="sudo killall -HUP mDNSResponder"

# time machine log
#alias tmlog="syslog -F '\$Time \$Message' -k Sender com.apple.backupd-auto -k Time ge -30m | tail -n 1"
alias tmlog="syslog -F '$Time $Message' -k Sender com.apple.backupd -k Time ge -30m | tail -n 15"

# list TODO/FIX lines from the current project
alias todos="ack -n -r --nogroup '(TODO|FIX(ME)?):'"

# create a Taskpaper todo file in the current folder
alias tp='touch todo.taskpaper && open -a "Taskpaper" todo.taskpaper'

# http://brettterpstra.com/2013/03/14/more-command-line-handiness/
alias psgrep="ps -Aco pid,comm | sed 's/^ *//'| sed 's/:/ /'|grep -iE"
#---

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
