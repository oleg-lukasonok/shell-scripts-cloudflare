#!/bin/zsh
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/loggers/lib/--index-api.sh

. ./.scripts/os-manager/lib/-package-install.sh

__debian_pullSignKey() {
    local FUNCTION_NAME="__debian_pullSignKey"
    _loggers_debug "${FUNCTION_NAME}"

    local FILE_SIGN_GPG="/usr/share/keyrings/cloudflare-main.gpg"

    if
        [ ! -e "${FILE_SIGN_GPG}" ]
    then
        local COMMAND=""
        if
            [ ! "${USER}" = "root" ]
        then
            COMMAND="sudo "
        fi
        local DIR_REQUIRED="/usr/share/keyrings"
        COMMAND="${COMMAND} mkdir -p --mode=0755 ${DIR_REQUIRED}"
        _loggers_debug "${FUNCTION_NAME}" "Initiate - Ensure dir ${DIR_REQUIRED} exists."
        eval "${COMMAND}"
        _loggers_debug "${FUNCTION_NAME}" "Succeeded - Ensure dir ${DIR_REQUIRED} exists."
        COMMAND="curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | "
        if
            [ ! "${USER}" = "root" ]
        then
            COMMAND="${COMMAND}sudo "
        fi
        COMMAND="${COMMAND}sudo tee ${FILE_SIGN_GPG} >/dev/null"
        _loggers_debug "${FUNCTION_NAME}" "Initiate - Pull & save signing keys."
        eval "${COMMAND}"
        _loggers_debug "${FUNCTION_NAME}" "Success - Pull & save signing keys."
    else
        _loggers_warn "${FUNCTION_NAME}" "Cloudflared sign keys were already pulled!"
    fi
}

__debian_addAptRepository() {
    local FUNCTION_NAME="__debian_addAptRepository"
    _loggers_debug "${FUNCTION_NAME}"

    local FILE_TARGET="/etc/apt/sources.list.d/cloudflared.list"
    if
        [ ! -e "${FILE_TARGET}" ]
    then
        local COMMAND="echo \"deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared $(lsb_release -cs) main\" | "
        if
            [ ! "${USER}" = "root" ]
        then
            COMMAND="${COMMAND}sudo "
        fi
        COMMAND="${COMMAND} tee ${FILE_TARGET}"

        _loggers_debug "${FUNCTION_NAME}" "Initiated - add apt repositories"
        eval "${COMMAND}"
        _loggers_debug "${FUNCTION_NAME}" "Succeeded - add apt repositories"
        if
            [ ! "${USER}" = "root" ]
        then
            COMMAND="sudo "
        fi
        COMMAND="${COMMAND} apt-get update"
        _loggers_debug "${FUNCTION_NAME}" "Initiated - apt-get update"
        eval "${COMMAND}"
        _loggers_debug "${FUNCTION_NAME}" "Succeeded - apt-get update"

    else
        _loggers_warn "${FUNCTION_NAME}" "Cloudflared appt repositories were added!"
    fi
}

_claudflared_package_install() {
    local FUNCTION_NAME="_claudflared_package_install"
    _loggers_info "${FUNCTION_NAME}"

    if
        [ "${LOCAL_OS_TYPE}" = "debian" ]
    then
        __debian_pullSignKey
        __debian_addAptRepository
    fi

    _osManager_packageInstall "claudflared"
}
