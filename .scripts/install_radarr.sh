#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

install_radarr()
{
    local APP_NAME="Radarr"

    local APP_PACKAGE="libmono-cil-dev"
    run_script 'install_via_package_manager' ${APP_NAME}" dependency (${APP_PACKAGE})" ${APP_PACKAGE}

    local APP_PACKAGE="mediainfo"
    run_script 'install_via_package_manager' ${APP_NAME}" dependency (${APP_PACKAGE})" ${APP_PACKAGE}

    info "Installing or updating ${APP_NAME}"
    cd /opt || fatal "Failed to change to /opt directory."
    curl -L -O $( curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 )
    tar -xvzf Radarr.develop.*.linux.tar.gz || fatal "Failed to unpack ${APP_NAME}"
    cd "${SCRIPTPATH}" || fatal "Failed to change to ${SCRIPTPATH} directory."
}