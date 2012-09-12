
# Cool History Summerizer
function historyhawk()
{
  history|awk '{a[$2]++}END{for(i in a){printf"%5d\t%s\n",a[i],i}}'|sort -nr|head;
}

# kinda like netstat
function ls-net()
{
  lsof -nPi | cut -f 1 -d " "| uniq | tail -n +2
}

# mkdir, cd into it
function mkcd() {
  mkdir -p "$*"
  cd "$*"
}

function serve()
{
  python -m SimpleHTTPServer ${1:-8080}
}

function ii()  # get current host related info  # kind of works on mac.  different interface.  dynamic-able?
{

  echo -e "\nYou are logged onto ${fg[magenta]}$HOST"
  echo -e "\n${fg[magenta]}Additionnal information:${reset_color}" ; uname -a
  echo -e "\n${fg[magenta]}Users logged on:${reset_color} " ; w -h
  echo -e "\n${fg[magenta]}Current date :${reset_color}" ; date
  echo -e "\n${fg[magenta]}Machine stats :${reset_color} " ; uptime
  echo -e "\n${fg[magenta]}Disk space :${reset_color} " ; df
  echo -e "\n${fg[magenta]}Memory stats :${reset_color} " ;
  vm_stat
  echo
}

function dvdrip()
{
  if [ -f $1 ]; then
    dvdbackup -M -n $1 -i /dev/disk1 -o ~/tmp/dvd
  else
    echo "Please supply the name of the DVD"
  fi
}

function resizeimg()
{
  if [ $# -eq 0 ]; then
    echo "Please supply one or more images to resize"
  else
    echo "Resizing $# image(s) to max width of 1024"
    sips --resampleHeightWidthMax 1024 "$1"
  fi
}

#
# Pow Scripts
#
function pow_stop()
{
  echo "Shutting down Pow..."
  launchctl unload "$HOME/Library/LaunchAgents/cx.pow.powd.plist" 2>/dev/null || true
}

function pow_start()
{
  echo "Starting Pow..."
  launchctl load -Fw "$HOME/Library/LaunchAgents/cx.pow.powd.plist" 2>/dev/null
}

function restart_pow()
{
  echo "*** Stopping the Pow server..."
  launchctl unload "$HOME/Library/LaunchAgents/cx.pow.powd.plist" 2>/dev/null || true
  echo "*** Starting the Pow server..."
  launchctl load "$HOME/Library/LaunchAgents/cx.pow.powd.plist" 2>/dev/null
  echo "Done"
}

function installpow()
{
  curl get.pow.cx | sh
}

function uninstallpow()
{
  curl get.pow.cx/uninstall.sh | sh
}


function clean_downloads()
{
  ~/bin/sweep.rb ~/Downloads
}



