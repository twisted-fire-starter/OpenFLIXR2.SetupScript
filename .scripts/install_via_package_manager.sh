#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

install_via_package_manager()
{
    local APP_NAME="${1}"
    local APP_PACKAGE="${2}"
    local SOURCE_FILE="${3:-}"
    local SOURCE_REPO="${4:-}"
    local SOURCE_KEY="${5:-}"

    info "Installing or updating ${APP_NAME}"
    if [[ "${SOURCE_FILE}" != "" && "${SOURCE_REPO}" != "" && -f "${SOURCE_FILE}" && $(grep -c "${SOURCE_REPO}" "${SOURCE_FILE}") == 0 ]]; then
        info "- Adding ${APP_NAME} repo to sources"
        rm "${SOURCE_FILE}"
        if [[ "${SOURCE_KEY}" != "" ]]; then
            gpg --list-keys ${SOURCE_KEY} || apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ${SOURCE_KEY} > /dev/null 2>&1
        fi
        echo "${SOURCE_REPO}" | tee "${SOURCE_FILE}" > /dev/null
    fi
    info "- Updating apt"
    apt-get -y update > /dev/null 2>&1 || error "Failed to update apt"
    info "- Updating Sonarr"
    apt-get -y install ${APP_PACKAGE} > /dev/null 2>&1 || error "Failed to install/update ${APP_NAME}"
}