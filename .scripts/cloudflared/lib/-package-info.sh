#!/bin/zsh
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/loggers/lib/--index-api.sh

. ./.scripts/os-manager/lib/--index.sh

_cloudflared_package_info() {
    local FUNCTION_NAME="_cloudflared_package_info"
    _loggers_info "${FUNCTION_NAME}"

    _osManager_packageInfo "cloudflared"
}
