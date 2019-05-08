#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

install_mono()
{
    local APP_NAME="Mono"
    local APP_PACKAGE="mono-devel"
    local SOURCE_FILE="/etc/apt/sources.list.d/mono-official-stable.list"
    local SOURCE_REPO="deb https://download.mono-project.com/repo/ubuntu stable-bionic main"
    local SOURCE_KEY="3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"

    run_script 'install_via_package_manager' ${APP_NAME} ${APP_PACKAGE} ${SOURCE_FILE} ${SOURCE_REPO} ${SOURCE_KEY}
}