#!/bin/zsh
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/loggers/lib/--index-api.sh

_cloudflared_tunnel_create() {
    local FUNCTION_NAME="_cloudflared_tunnel_create"

    if
        [ -z "${CLOUDFLARED_TUNNEL_NAME}" ]
    then
        local MESSAGE="Provide cloudflared tunnel name"
        read -p "${MESSAGE}"$'\n> ' CLOUDFLARED_TUNNEL_NAME
    fi
    _loggers_info "${FUNCTION_NAME}" "CLOUDFLARED_TUNNEL_NAME: ${CLOUDFLARED_TUNNEL_NAME}"

    # cloudflared tunnel create
}
