#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

install_sonarr()
{
    local APP_NAME="Sonarr"
    local APP_PACKAGE="nzb-drone"
    local SOURCE_FILE="/etc/apt/sources.list.d/sonarr.list"
    local SOURCE_REPO="deb http://apt.sonarr.tv/ master main"
    local SOURCE_KEY="0xA236C58F409091A18ACA53CBEBFF6B99D9B78493"

    run_script 'install_via_package_manager' ${APP_NAME} ${APP_PACKAGE} ${SOURCE_FILE} ${SOURCE_REPO} ${SOURCE_KEY}
}