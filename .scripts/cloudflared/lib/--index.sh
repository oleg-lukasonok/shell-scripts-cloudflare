#!/bin/zsh
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------
#
#       --> passed parameters are read & exported environment variables
#
. ./.scripts/cloudflared/lib/--env-vars-reader.sh
#
#       --> required environment variables are validated for existance
#
. ./.scripts/cloudflared/lib/--env-vars-validator.sh
#
#       --> available functions are imported/exported
#
. ./.scripts/cloudflared/lib/--index-api.sh
# -------------------------------------------------------------------------------------
