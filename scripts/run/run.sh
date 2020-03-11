#!/usr/bin/env bash
# Do not use this script manually, Use makefile

source ./scripts/setup-variables.sh

###############################################
# This script is used to start monitoror core #
###############################################

ldflags="-w  \
-X \"github.com/monitoror/monitoror/cli/version.GitCommit=${MB_GITCOMMIT}\" \
-X \"github.com/monitoror/monitoror/cli/version.BuildTime=${MB_BUILDTIME}\" \
-X \"github.com/monitoror/monitoror/cli/version.Version=${MB_VERSION}\" \
-X \"github.com/monitoror/monitoror/cli/version.Tags=${MB_GO_TAGS}\" \
${MB_GO_LDFLAGS:-} \
"

# Force dev environment
MO_ENV=${MO_ENV:-$MB_ENVIRONMENT}

go run --ldflags "$ldflags" --tags "$MB_GO_TAGS" "${MB_SOURCE_PATH}"
