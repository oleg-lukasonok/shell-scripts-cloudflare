#!/bin/zsh
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/loggers/lib/--index-api.sh

. ./.scripts/os-manager/lib/-package-uninstall.sh

_claudflared_package_uninstall() {
    local FUNCTION_NAME="_claudflared_package_uninstall"
    _loggers_info "${FUNCTION_NAME}"

    _osManager_packageUninstall "claudflared"
}
