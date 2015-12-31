#
# Color grep results
# Examples: http://rubyurl.com/ZXv
#
#export GREP_OPTIONS='--color=auto'
#export GREP_COLOR='1;32'
GREP_OPTIONS="--color=auto --exclude-dir=.git"
alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS
