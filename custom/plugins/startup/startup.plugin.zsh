local DROPBOXDIR="${HOME}/Dropbox"
local WORKDIR="${HOME}/work"
local BACKUPDIR="${DROPBOXDIR}/backups" # Backup directory
local BACKUPGIT="${WORKDIR}/dotfiles"   # dotfiles git directory 
local DEFAULTBACKUPDIR="${HOME}/backups"

# Startup Banner
if [ -e "/usr/bin/uptime" ]; then
  echo "Uptime: ` /usr/bin/uptime`"
fi

#-----------------------------------------------------------
#@ Make $HOME more comfy
#-----------------------------------------------------------
if [ ! -d "${HOME}/bin" ]; then
  mkdir ${HOME}/bin
  chmod 700 ${HOME}/bin
  echo "${HOME}/bin was missing.  I recreated it for you."
fi
if [ ! -d "${HOME}/Documents" ]; then
  if ! [  -d "${HOME}/data" ]; then
    mkdir ${HOME}/data
    chmod 700 ${HOME}/data
    echo "${HOME}/data was missing.  I recreated it for you."
  fi
fi
if [ ! -d "${HOME}/tmp" ]; then
  mkdir ${HOME}/tmp
  chmod 700 ${HOME}/tmp
  echo "${HOME}/tmp was missing.  I recreated it for you."
fi

if [ ! -d "${DROPBOXDIR}" ]; then
  BACKUPDIR="${DEFAULTBACKUPDIR}"
  if [ ! -d "${BACKUPDIR}" ]; then
    mkdir ${BACKUPDIR}
    chmod 700 ${BACKUPDIR}
    echo "${BACKUPDIR}/ was missing.  I recreated it for you."
  fi
fi

if [ -d "${BACKUPDIR}" ]; then
  if [ ! -d "${BACKUPDIR}/configs" ]; then
    mkdir ${BACKUPDIR}/configs
    chmod 700 ${BACKUPDIR}/configs
    echo "${BACKUPDIR}/configs was missing.  I recreated it for you."
  fi

  if [ ! -d "${BACKUPDIR}/scripts" ]; then
    mkdir ${BACKUPDIR}/scripts
    chmod 700 ${BACKUPDIR}/scripts
    echo "${BACKUPDIR}/scripts was missing.  I recreated it for you."
  fi
fi

if [ -d "${WORKDIR}" ]; then
  if [ ! -d "${BACKUPGIT}" ]; then
    mkdir ${BACKUPGIT}
    chmod 700 ${BACKUPGIT}
    echo "${BACKUPGIT} was missing.  I recreated it for you."
  fi
fi


