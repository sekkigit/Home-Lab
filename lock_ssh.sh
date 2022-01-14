#!/bin/bash

SSHD="/etc/ssh/sshd_config"
PARAM[1]="PermitRootLogin "
PARAM[2]="PubkeyAuthentication"
PARAM[3]="AuthorizedKeysSSHD"
PARAM[4]="PasswordAuthentication"

edit_sshd_config(){
  for PARAM in ${PARAM[@]}
  do
    /usr/bin/sed -i '/^'"${PARAM}"'/d' ${SSHD}
    /usr/bin/echo "All lines beginning with '${PARAM}' were deleted from ${SSHD}."
  done
  /usr/bin/echo "${PARAM[1]} no" >> ${SSHD}
  /usr/bin/echo "'${PARAM[1]} no' was added to ${SSHD}."
  /usr/bin/echo "${PARAM[2]} yes" >> ${SSHD}
  /usr/bin/echo "'${PARAM[2]} yes' was added to ${SSHD}."
  /usr/bin/echo "${PARAM[3]} .ssh/authorized_keys" >> ${SSHD}
  /usr/bin/echo "'${PARAM[3]} .ssh/authorized_keys' was added to ${SSHD}."
  /usr/bin/echo "${PARAM[4]} no" >> ${SSHD}
  /usr/bin/echo "'${PARAM[4]} no' was added to ${SSHD}"
}

reload_sshd(){
  /usr/bin/systemctl reload sshd.service
  /usr/bin/echo "Run '/usr/bin/systemctl reload sshd.service'...OK"
}

edit_sshd_config
reload_sshd