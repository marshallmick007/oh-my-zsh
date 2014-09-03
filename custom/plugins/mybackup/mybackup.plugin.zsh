
function backupconfigs()
{
  BPATH="${BACKUPDIR}/configs"
  echo -e "${fg[magenta]}Backing up config files to ${BPATH}${reset_color}"
  if [ -d "${BPATH}" ]; then
    echo "Backing up .zshrc to ${BPATH}/zshrc"
    cp ~/.zshrc ${BPATH}/zshrc
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
    echo "Backing up .gdbinit"
    cp ~/.gdbinit ${BPATH}/gdbinit
    echo "Backing up Ruby files..."
    cp ~/.irbrc ${BPATH}/irbrc
    cp ~/.pryrc ${BPATH}/pryrc
    cp ~/.aprc ${BPATH}/aprc
    echo "Backing up MongoDb"
    cp ~/.mongodb/mongod.conf ${BPATH}/mongod.conf
    echo "Backing up Pianobar (.config/paniobar/config)"
    cp ~/.config/pianobar/config ${BPATH}/pianobarconfig
    echo "Backing up LaunchAgents"
    cp ~/Library/LaunchAgents/org.mickelson.* ${BPATH}
    cp ~/Library/LaunchAgents/local.* ${BPATH}
    echo "Backing up php-fpm"
    cp /usr/local/etc/php/5.4/php-fpm.conf ${BPATH}
    echo "Backing Up XCode themes"
    cp -v ~/Library/Developer/Xcode/UserData/FontAndColorThemes/* ${BPATH}/xcode/themes
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

function backupssh()
{
  BPATH="${BACKUPDIR}/ssh"
  mkdir -p ${BPATH}
  if [ -d "${BPATH}" ]; then
    echo -e "${fg[magenta]}Backing up ~/.ssh folder to ${BPATH}${reset_color}"
    cp ~/.ssh/config ${BPATH}/config
    cp ~/.ssh/id_rsa_vagrant ${BPATH}/id_rsa_vagrant
  else
    echo "Backup directory ${BPATH} does not exist!"
  fi

}

function backup1pass()
{
  kbase=`which keybase`
  onepassfile="/Users/marshall/Documents/1Password.agilekeychain"
  echo -e "${fg[magenta]}Backing up 1Password keychain${BPATH}${reset_color}"
  if [ -x "${kbase}" ]; then
    echo -e "${fg[red]}Need to find out how to encrypt a folder.${reset_color}"
    echo -e "See: https://keybase.io/docs/command_line"
    #keybase encrypt marshall ${onepassfile} -o "${BACKUPDIR}/1Password.agilekeychain.asc"
  else
    echo "Unable to backup 1Password. You need to install 'keybase'"
  fi
}

function backupnginx()
{
  FILESROOT="/etc"
  OS=$(uname)
  if [ $OS = "Darwin" ]; then
    FILESROOT="/usr/local/etc"
  fi
  BPATH2="${BACKUPDIR}/nginx"
  mkdir -p ${BPATH2}

  if [ -d "${BPATH2}" ]; then
    echo -e "${fg[magenta]}Backing up nginx to ${BPATH2}${reset_color}"
    cp -Rv ${FILESROOT}/nginx/* ${BPATH2}
  else
    echo "Backup directory ${BPATH2} does not exist!"
  fi

  BPATH2="${BACKUPDIR}/php"
  mkdir -p ${BPATH2}

  if [ -d "${BPATH2}" ]; then
    echo -e "${fg[magenta]}Backing up php to ${BPATH2}${reset_color}"
    cp -Rv ${FILESROOT}/php/* ${BPATH2}
  else
    echo "Backup directory ${BPATH2} does not exist!"
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
  backupnginx
  #backup1pass
}

