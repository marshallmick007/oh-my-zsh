local OS=Linux
case $(uname) in
    FreeBSD) OS=FreeBSD ;;
    Darwin) OS=Darwin ;;
    *) OS=Linux ;;
esac

if [[ "$OS" == "Linux" ]]; then
  alias ls="ls -lFh --color=auto"
  alias large_files="find . -type f -size +10000k -exec ls -lh {} \; | awk '{print \$5 \": \" \$9}'"

  alias large_folders="command du -a .  | sort -n -r | head -n 10"
  alias flip_screen="$HOME\bin\rotate.sh toggle"
  alias reset_screen="$HOME\bin\rotate.sh reset"
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

alias htop="sudo htop --sort-key PERCENT_CPU -d 30"
alias df="df -h"
alias du="du -h"
alias lh="ls -lh .[a-zA-Z0-9]*"
alias ll="ls -lh"
alias lla="ls -lha"
alias lsd="ls -ld"
alias lsold="ls -At1 && echo '------Oldest--'"
alias lsnew='ls -Art1 && echo "------Newest--"'
alias mkdir="mkdir -p"
alias mv="mv -i"
#alias path="env | grep PATH"
#alias pcd="cd -"
alias ps="ps aux"
alias rm="rm -i"
alias pandora="pianobar"
alias hsplit="split_tab"
alias vsplit="split_tab"
alias weather="ansiweather"


if [[ "$OS" == "Darwin" ]]; then
  alias ls="ls -lFhG"
  alias ff="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
  alias vim=mvim
  #---
  # begin http://brettterpstra.com/2013/03/31/a-few-more-of-my-favorite-shell-aliases/

  # copy the working directory path
  alias cpwd='pwd|tr -d "\n"|pbcopy'

  # DNS (with update thanks to @blanco)
  alias flush="sudo killall -HUP mDNSResponder"

  # time machine log
  #alias tmlog="syslog -F '\$Time \$Message' -k Sender com.apple.backupd-auto -k Time ge -30m | tail -n 1"
  alias tmlog="syslog -F '$Time $Message' -k Sender com.apple.backupd -k Time ge -30m | tail -n 10"

  alias lastbackup="timedog -d 5 -l"

  # create a Taskpaper todo file in the current folder
  alias tp='touch todo.taskpaper && open -a "Taskpaper" todo.taskpaper'
  #---

  alias f='open -a Finder '
fi

# http://brettterpstra.com/2013/03/14/more-command-line-handiness/
alias psgrep="ps -Aco pid,comm | sed 's/^ *//'| sed 's/:/ /'|grep -iE"
# list TODO/FIX lines from the current project
alias todos="ack -n -r --nogroup '(TODO|FIX(ME)?):'"



#alias guard='bundle exec guard start -i'

alias HEX="ruby -e 'printf(\"0x%X\n\", ARGV[0])'"
alias DEC="ruby -e 'printf(\"%d\n\", ARGV[0])'"
alias BIN="ruby -e 'printf(\"%bb\n\", ARGV[0])'"
alias WORD="ruby -e 'printf(\"0x%04X\n\", ARGV[0])'"

alias prettyjson="python -mjson.tool"

# https://github.com/marshallmick007/gitcheck
alias gitcheck="python /Library/Python/2.7/site-packages/gitcheck.py -v"


# Get readable list of network IPs
#alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="jsonip.rb"
alias lsip="lsip"

alias flush="dscacheutil -flushcache" # Flush DNS cache

# via https://gist.githubusercontent.com/frdmn/7853158/raw/bash_aliases
alias nginx.start='sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.stop='sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.restart='nginx.stop && nginx.start'
alias nginx.reload='sudo kill -HUP $( cat /usr/local/var/run/nginx.pid )'
alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php54.plist"
alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php54.plist"
alias php-fpm.restart='php-fpm.stop && php-fpm.start'
alias mysql.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.restart='mysql.stop && mysql.start'

alias php-fpm.logs.error='tail -250f /usr/local/Cellar/php54/5.4.32/var/log/php-fpm.log'

