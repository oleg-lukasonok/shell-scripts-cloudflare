#!/bin/zsh
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/cloudflared/lib/-package-info.sh
. ./.scripts/cloudflared/lib/-package-install.sh
. ./.scripts/cloudflared/lib/-package-uninstall.sh

. ./.scripts/cloudflared/lib/-tunnel-create.sh
. ./.scripts/cloudflared/lib/-tunnel-list-many-by-query.sh
. ./.scripts/cloudflared/lib/-tunnel-login.sh
