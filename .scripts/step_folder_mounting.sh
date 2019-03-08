#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

step_folder_mounting() {
    MOUNT_MANAGE="webmin"
    whiptail --title "Step ${step_number}: ${step_name}" --msgbox "$(cat ${SCRIPTPATH}/.misc/folder_mounting.txt)\nhttp://${LOCAL_IP}/webmin/" 10 75
    run_script 'check_response' $?;

    set_config "MOUNT_MANAGE" $MOUNT_MANAGE
}