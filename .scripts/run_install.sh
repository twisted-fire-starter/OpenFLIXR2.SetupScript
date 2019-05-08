#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

run_install() {
    run_script 'update_system'
    run_script 'install_tzupdate'
    run_script 'install_mono'
    run_script 'install_sonarr'
    run_script 'install_radarr'
}
