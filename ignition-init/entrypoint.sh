#!/usr/bin/env bash
set -eo pipefail
INIT_FILE=${IGNITION_DATA_DIR}/.ignition-initialized-successfully

if ! [ -f "${INIT_FILE}" ]; then
   echo -n "Extracting ${IGNITION_DATA_FILE} to ${IGNITION_DATA_DIR} ... "
   tar xzf ${IGNITION_DATA_FILE} -C ${IGNITION_DATA_DIR} --touch --no-overwrite-dir

   touch ${INIT_FILE}
   chown -R 0:0 ${IGNITION_DATA_DIR}
   chmod -R g=u ${IGNITION_DATA_DIR}
   echo "success!"
else
   echo "Directory ${IGNITION_DATA_DIR} is already initialized. No changes were made."  
fi

exit 0