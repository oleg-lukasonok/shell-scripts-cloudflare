#!/bin/zsh
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/loggers/lib/--index-api.sh

_cloudflared_tunnel_login() {
    local FUNCTION_NAME="_cloudflared_tunnel_login"
    _loggers_info "${FUNCTION_NAME}"

    cloudflared tunnel login
}
