#!/usr/bin/env bash
# Do not use this script manually, Use makefile

source ./scripts/setup-variables.sh

##########################################
# This script is used to build monitoror #
##########################################

# Override OS/ARCH
if [[ $# -eq 1 ]]; then
  if [[ $1 == "linux/amd64" ]]; then
    GOOS=linux
    GOARCH=amd64
  elif [[ $1 == "linux/ARMv5" ]]; then
    GOOS=linux
    GOARCH=arm
    GOARM=5
  elif [[ $1 == "windows" ]]; then
    GOOS=windows
    GOARCH=amd64
  elif [[ $1 == "macos" ]]; then
    GOOS=darwin
    GOARCH=amd64
  fi
fi

# Define target base name
targetBaseName="$MB_BINARIES_PATH/monitoror"

# Define target os/arch decorator
targetOsArch="-$GOOS-$GOARCH"
if [[ $GOOS == "darwin" ]]; then
  targetOsArch="-macos"
fi

# Define target version decorator
targetVersion="-$MB_VERSION"

# Define target tags decorator
targetTags=""
if [[ $MB_GO_TAGS != "" ]]; then
  targetTags="-${MB_GO_TAGS/,/-}"
fi

# Define target extention
ext=""
if [[ $GOOS == "windows" ]]; then
  ext=".exe"
fi

# Target
target=$(printf %s%s%s%s%s "$targetBaseName" "$targetOsArch" "$targetVersion" "$targetTags" "$ext")

# LDFLAGS
ldflags="-w  \
-X \"github.com/monitoror/monitoror/cli/version.GitCommit=${MB_GITCOMMIT}\" \
-X \"github.com/monitoror/monitoror/cli/version.BuildTime=${MB_BUILDTIME}\" \
-X \"github.com/monitoror/monitoror/cli/version.Version=${MB_VERSION}\" \
-X \"github.com/monitoror/monitoror/cli/version.Tags=${MB_GO_TAGS}\" \
${MB_GO_LDFLAGS:-} \
"

# Disable Garbage collector for build
CGO_ENABLED=0
OGC=off

echo "Building statically linked $target"
go build -o "$target" --ldflags "$ldflags" --tags "$MB_GO_TAGS" "${MB_SOURCE_PATH}"
