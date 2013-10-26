
NGINXPID=/usr/local/var/run/nginx.pid

function devstatus() 
{

}

function restart-nginx()
{
  sudo kill -HUP $( cat $NGINXPID )
}

function restart-nginx-launchctl()
{
  sudo launchctl stop homebrew.mxcl.nginx
  echo "nginx Stopped"
  sudo launchctl start homebrew.mxcl.nginx
  sleep 1
  if [ -e $NGINXPID ]; then
    echo "nginx Started"
  fi

}
