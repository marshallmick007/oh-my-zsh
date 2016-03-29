
# Cool History Summerizer
function historyhawk()
{
  history|awk '{a[$2]++}END{for(i in a){printf"%5d\t%s\n",a[i],i}}'|sort -nr|head;
}

# finds all node_modules within the current folder
function find_node_modules()
{
  # maxdepth of 4 is used so it can run in the `work`
  # folder and find all node_modules
  find ~/work -type d -regex ".*/node_modules$" -maxdepth 4
}

# kinda like netstat
function ls-net()
{
  lsof -nPi | cut -f 1 -d " "| uniq | tail -n +2
}


# make a backup of a file
# # https://github.com/grml/grml-etc-core/blob/master/etc/zsh/zshrc
function bk() 
{
  cp -a "$1" "${1}_$-a(date --iso-8601=seconds)"
}


# display a list of supported colors
function lscolors {
  ((cols =  $COLUMNS - 4))
  s=$(printf %${cols}s)
  for i in {000..$(tput colors)}; do
    echo -e $i $(tput setaf $i; tput setab $i)${s// /=}$(tput op);
  done
}

# get the content type of an http resource
function htmime {
  if  [[ -z $1 ]]; then
    print "USAGE: htmime <URL>"
    return 1
  fi
  mime=$(curl -sIX HEAD $1 | sed -nr "s/Content-Type: (.+)/\1/p")
  print $mime
}


# get public ip
function lsip {
  local api
  case "$1" in
        "-4")
            api="http://v4.ipv6-test.com/api/myip.php"
            ;;
        "-6")
            api="http://v6.ipv6-test.com/api/myip.php"
            ;;
        *)
            api="http://ipv6-test.com/api/myip.php"
            ;;
  esac
  curl -s "$api"
  echo # Newline.
 }

# ls archives (inspired by `extract`)
function lsz() {
  if [ $# -ne 1 ]
  then
    echo "lsz filename.[tar,tgz,gz,zip,etc]"
    return 1
  fi
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2|*.tar.gz|*.tar|*.tbz2|*.tgz) tar tvf $1;;
      *.zip) unzip -l $1;;
      *) echo "'$1' unrecognized." ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
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

function gonginx() 
{
  pushd
  cd /usr/local/etc/nginx
}

function clean_downloads()
{
  ~/bin/sweep.rb ~/Downloads
}

function show_mas_applications()
{
  find /Applications \
    -path '*Contents/_MASReceipt/receipt' \
    -maxdepth 4 -print |\
    sed 's#.app/Contents/_MASReceipt/receipt#.app#g;'
}

function nzbup()
{
  mv -v ~/Downloads/*.nzb ~/Downloads/autonzb
}

function killpulse()
{
  killall pulseaudio
  rm -Rf ~/.config/pulse
}

# From http://brettterpstra.com/2015/01/05/sizeup-tidy-filesize-information-in-terminal/

__sizeup_build_query () {
  local bool="and"
  local query=""
  for t in $@; do
    query="$query -$bool -iname \"*.$t\""
    bool="or"
  done
  echo -n "$query"
}

__sizeup_humanize () {
  local size=$1
  if [ $size -ge 1073741824 ]; then
    printf '%6.2f%s' $(echo "scale=2;$size/1073741824"| bc) G
  elif [ $size -ge 1048576 ]; then
    printf '%6.2f%s' $(echo "scale=2;$size/1048576"| bc) M
  elif [ $size -ge 1024 ]; then
    printf '%6.2f%s' $(echo "scale=2;$size/1024"| bc) K
  else
    printf '%6.2f%s' ${size} b
  fi
}

sizeup () {
  local helpstring="Show file sizes for all files with totals\n-r\treverse sort\n-[0-3]\tlimit depth (default 4 levels, 0=unlimited)\nAdditional arguments limit by file extension\n\nUsage: sizeup [-r[0123]] ext [,ext]"
  local totalb=0
  local size output reverse OPT
  local depth="-maxdepth 4"
  OPTIND=1
  while getopts "hr0123" opt; do
    case $opt in
      r) reverse="-r " ;;
      0) depth="" ;;
      1) depth="-maxdepth 1" ;;
      2) depth="-maxdepth 2" ;;
      3) depth="-maxdepth 3" ;;
      h) echo -e $helpstring; return;;
      \?) echo "Invalid option: -$OPTARG" >&2; return 1;;
    esac
  done
  shift $((OPTIND-1))

  local cmd="find . $depth -type f $(__sizeup_build_query $@)"
  local counter=0
  while read -r file; do
    counter=$(( $counter+1 ))
    # Darwin
    #size=$(stat -f '%z' "$file")
    size=$(stat -c '%s' "$file")
    totalb=$(( $totalb+$size ))
    >&2 echo -ne $'\E[K\e[1;32m'"${counter}:"$'\e[1;31m'" $file "$'\e[0m'"("$'\e[1;31m'$size$'\e[0m'")"$'\r'
    # >&2 echo -n "$(__sizeup_humanize $totalb): $file ($size)"
    # >&2 echo -n $'\r'
    output="${output}${file#*/}*$size*$(__sizeup_humanize $size)\n"
  done < <(eval $cmd)
  >&2 echo -ne $'\r\E[K\e[0m'
  echo -e "$output"| sort -t '*' ${reverse}-nk 2 | cut -d '*' -f 1,3 | column -s '*' -t
  echo $'\e[1;33;40m'"Total: "$'\e[1;32;40m'"$(__sizeup_humanize $totalb)"$'\e[1;33;40m'" in $counter files"$'\e[0m'
}

