
function backupconfigs()
{
  BPATH="${BACKUPDIR}/configs"
  echo -e "${fg[magenta]}Backing up config files to ${BPATH}${reset_color}"
  if [ -d "${BPATH}" ]; then
    echo "Backing up .bashrc to ${BPATH}/bashrc"
    cp ~/.bashrc ${BPATH}/bashrc
    echo "Backing up .gitconfig to ${BPATH}/gitconfig"
    cp ~/.gitconfig ${BPATH}/gitconfig
    echo "Backing up .gitignore_global to ${BPATH}/gitignore_global"
    cp ~/.gitignore_global ${BPATH}/gitignore_global
    echo "Backing up .inputrc to ${BPATH}/inputrc"
    cp ~/.inputrc ${BPATH}/inputrc
    echo "Backing up .profile to ${BPATH}/profile"
    cp ~/.profile ${BPATH}/profile
    echo "Backing up hosts file to ${BPATH}/hosts"
    cp /etc/hosts ${BPATH}/hosts
    echo "Backing up httpd.conf file to ${BPATH}/httpd.conf"
    cp /Applications/MAMP/conf/apache/httpd.conf ${BPATH}/httpd.conf
    echo "Backing up httpd-vhosts.conf file to ${BPATH}/httpd-vhosts.conf"
    cp /Applications/MAMP/conf/apache/httpd-vhosts.conf ${BPATH}/httpd-vhosts.conf
    echo "Backing up zzz_pow.conf file to ${BPATH}/zzz_pow.conf"
    cp /Applications/MAMP/conf/apache/other/zzz_pow.conf ${BPATH}/zzz_pow.conf
    echo "Backing up powconfig configuration"
    cp ~/.powconfig ${BPATH}/powconfig
    echo "Backing up .gdbinit"
    cp ~/.gdbinit ${BPATH}/gdbinit
    echo "Backing up .rvmrc file to ${BPATH}/rvmrc"
    cp ~/.rvmrc ${BPATH}/rvmrc
    echo "Backing up Ruby files..."
    cp ~/.irbrc ${BPATH}/irbrc
    cp ~/.pryrc ${BPATH}/pryrc
    cp ~/.aprc ${BPATH}/aprc
    echo "Backing up .osx"
    cp ~/.osx ${BPATH}/_osx
    echo "Backing up VIM"
    cp ~/.janus.rake ${BPATH}/vim/janus.rake
    cp ~/.vim/vimrc ${BPATH}/vim/vimrc
    cp ~/.vim/gvimrc ${BPATH}/vim/gvimrc
    cp ~/.vim/README.markdown ${BPATH}/vim/README.markdown
    cp ~/.vimrc.local ${BPATH}/vimrc.local
    cp ~/.gvimrc.local ${BPATH}/gvimrc.local
    echo "Backing up MongoDb"
    cp ~/.mongodb/mongod.conf ${BPATH}/mongod.conf

    echo -e "${fg[magenta]}Dumping dot files to github dropbox. ${BACKUPGIT}${reset_color}"
    cp -Rv ${BPATH}/* ${BACKUPGIT}
    echo -e "${fg[red]}Don't forget to git commit the files in ${BACKUPGIT}${reset_color}"
  else
    echo "Backup directory ${BPATH} does not exist!"
  fi
}

function backupscripts()
{
  BPATH="${BACKUPDIR}/scripts"
  if [ -d "${BPATH}" ]; then
    echo -e "${fg[magenta]}Backing up ~/bin folder to ${BPATH}${reset_color}"
    cp -v ~/bin/* ${BPATH}
  else
    echo "Backup directory ${BPATH} does not exist!"
  fi
}

function backup1pass()
{
  echo -e "${fg[magenta]}Backing up 1Password keychain${BPATH}${reset_color}"
  if [ -f ~/bin/backup1pass.py ]; then
    ~/bin/backup1pass.py
  else
    echo "Unable to backup 1Password"
  fi
}

function backup()
{
  #TODO:  Backup CyberDuck bookmarks
  #       Backup GlimmerBlocker settings
  #       GPG Public Key
  #       Source Code
  #       Select Documents
  backupscripts
  backupconfigs
  backup1pass
}

