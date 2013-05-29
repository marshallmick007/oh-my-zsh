# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# adapted from https://github.com/nojhan/liquidprompt/blob/master/liquidprompt

# TODO: try to only query for MICK_OS and _MICK_CPUNUM once, when the shell starts
#       to avoid extraneous calls to sysctl which might slow things down

# LP_OS detection, default to Linux
case $(uname) in
    FreeBSD) MICK_OS=FreeBSD ;;
    Darwin) MICK_OS=Darwin ;;
    *) MICK_OS=Linux ;;
esac

# Get cpu count
case "$MICK_OS" in
    Linux) _MICK_CPUNUM=$( nproc 2>/dev/null || grep -c '^[Pp]rocessor' /proc/cpuinfo ) ;;
    FreeBSD|Darwin) _MICK_CPUNUM=$( sysctl -n hw.ncpu ) ;;
esac

# get current load
case "$MICK_OS" in
    Linux)
        _mick_cpu_load () {
            local load eol
            read load eol < /proc/loadavg
            echo "$load"
        }
        ;;
    Darwin)
        _mick_cpu_load () {
            local load
            load=$(LANG=C sysctl -n vm.loadavg | awk '{print $2}')
            echo "$load"
        }
esac

function _mick_host() {
  #TODO: deal with su/sudo
  #      https://github.com/nojhan/liquidprompt/blob/master/liquidprompt
  if [[ -n "$SSH_CLIENT$SSH2_CLIENT$SSH_TTY" ]] ; then
    # we are in a SSH session, so show the host
    # TODO: color the ssh user a bright color to stand out
    echo "%{$fg[green]%}[%{$terminfo[bold]$fg[blue]%}%n@%m%{$fg[green]%}]%{$reset_color%}-"
  else
    echo ""
  fi
}

# for vim prompt
function _mick_vim_pwd() {
  # similar function to this
  # echo $(pwd | perl -pe "s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g")
  # TODO: Figure out how wide the terminal is
  local _tmpdirmaxlen=45
  local _trunc_symbol=".."
  local _vim_dirname="${PWD/#$HOME/~}"

  # account for the added overhead of the git prompt
  if [ ${#$(git_prompt_info)} -gt 0 ]; then
    _tmpdirmaxlen=32
  fi
  local _dir=${PWD##*/}
  _tmpdirmaxlen=$(( ( _tmpdirmaxlen < ${#_dir} ) ? ${#_dir} : _tmpdirmaxlen ))
  local _tmpdiroffset=$(( ${#_vim_dirname} - _tmpdirmaxlen ))
  local _tmpdir="`pwd | sed "s#$HOME#~#"`"

  if [ ${_tmpdiroffset} -gt "0" ]; then
    _vim_dirname=''
    if [[ $_tmpdir == "~" ]]; then
      _vim_dirname=$_tmpdir
    else
      _vim_dirname=`dirname "${_tmpdir}" | sed -E "s/\/(.)[^\/]*/\/\1/g"`

      if [[ $_vim_dirname == "/" ]]; then
        _vim_dirname=""
      fi
      _vim_dirname="${_vim_dirname}/`basename "${_tmpdir}"`"
    fi
  fi
  #echo ${_tmpdiroffset} 
  echo "${_vim_dirname}"
}

# for load average
function load_average() {
  local load_avg_one=`uptime | sed -e 's/.*load average[s]*: \(.*\...\)\(.*\...\)\(.*\...\)/\1/' -e 's/ //g'`
  local load_avg_hundred=`echo -e "scale=0 \n ${load_avg_one}/0.01 \nquit \n" | bc`
  local load_color="%{$fg[green]%}"
  if [[ ${load_avg_hundred} -gt 66 ]]; then
    load_color="%{$fg[red]%}"
  else
    if [[ ${load_avg_hundred} > 33 ]]; then
      load_color="%{$fg[yellow]%}"
    fi
  fi
  echo "${load_color}${load_avg_hundred} %{$reset_color%}"
}

function load_average_x() {
  local load="$(_mick_cpu_load | sed 's/\.//g;s/^0*//g' )"
  let "load=${load:-0}/$_MICK_CPUNUM"
  local load_color_x="%{$fg[green]%}"

  if [[ ${load} -gt 66 ]]; then
    load_color_x="%{$fg[red]%}"
  else
    if [[ ${load} > 33 ]]; then
      load_color_x="%{$fg[yellow]%}"
    fi
  fi
  echo "${load_color_x}${load} %{$reset_color%}"
}


local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

local load_avg='$(load_average_x)'
#local user_host='%{$fg[green]%}[%{$terminfo[bold]$fg[blue]%}%n@%m%{$fg[green]%}]%{$reset_color%}'
local user_host='$(_mick_host)'
local current_dir='%{$fg[green]%}[%{$terminfo[bold]$fg[magenta]%}$(_mick_vim_pwd)%{$fg[green]%}]%{$reset_color%}'
local current_time='%{$fg[green]%}[%{$terminfo[bold]$fg[green]%}%T%{$fg[green]%}]%{$reset_color%}'


PROMPT="${load_avg}${user_host}${current_dir}-${current_time}${git_branch}
%B%{$fg[green]%}#:>%b%{$reset_color%} "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="-%{$fg[green]%}[%{$fg[yellow]%}± "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡"
