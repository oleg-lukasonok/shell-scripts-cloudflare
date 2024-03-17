#!/bin/zsh
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/loggers/lib/--index-api.sh

_cloudflared_tunnel_listManyByQuery() {
    local FUNCTION_NAME="_cloudflared_tunnel_listManyByQuery"
    _loggers_info "${FUNCTION_NAME}"

    local RET_VAL=$(
        cloudflared tunnel list
    )
    echo "${RET_VAL}"
}
