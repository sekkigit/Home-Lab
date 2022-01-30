#!/bin/bash

source .var

echo "$KEY" >> /home/$USER/.ssh/authorized_keys

edit_sshd_config(){
  for PARAM in ${PARAM[@]}
  do
    sed -i '/^'"${PARAM}"'/d' ${FILE}
    echo "All lines beginning with '${PARAM}' were deleted from ${FILE}."
  done
  echo "${PARAM[1]} no" >> ${FILE}
  echo "'${PARAM[1]} no' was added to ${FILE}."
  echo "${PARAM[2]} yes" >> ${FILE}
  echo "'${PARAM[2]} yes' was added to ${FILE}."
  echo "${PARAM[3]} $PORTSSH" >> ${FILE}
  echo "'${PARAM[3]} $PORTSSH' was added to ${FILE}."
  echo "${PARAM[4]} no" >> ${FILE}
  echo "'${PARAM[4]} no' was added to ${FILE}"
}

reload_sshd(){
  /usr/bin/systemctl reload sshd.service
  /usr/bin/echo "Run '/usr/bin/systemctl reload sshd.service'...OK"
}

edit_sshd_config
reload_sshd