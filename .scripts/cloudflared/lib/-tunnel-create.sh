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

        echo -n "${MESSAGE}\n> " >&2

        read CLOUDFLARED_TUNNEL_NAME
    fi
    _loggers_info "${FUNCTION_NAME}" "CLOUDFLARED_TUNNEL_NAME: ${CLOUDFLARED_TUNNEL_NAME}"

    local RESPONSE=$(
        cloudflared tunnel create --output json "${CLOUDFLARED_TUNNEL_NAME}"
    )
    echo "${RESPONSE}" >"${DIR_CLOUDFLARED_LOCAL_STORAGE}/${CLOUDFLARED_TUNNEL_NAME}.json"

    local TUNNEL_ID=$(
        echo "${RESPONSE}" | jq -r '.id'
    )

    local CONFIG_YAML='
    tunnel: <UUID>
    credentials-file: /root/.cloudflared/<UUID>.json

    ingress:
        - hostname: <domain>
            service: https://localhost:8006
            originRequest:
                disableChunkedEncoding: true
                noTLSVerify: true
        - service: http_status:404
    '

}
