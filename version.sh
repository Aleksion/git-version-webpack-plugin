#!/bin/bash
#
#   version.sh
#   Generate version string for a git directory
#
# Usage:
#
#   Generate version string for landing app
#   $ ./version.sh ../landing

# Error out on first non-true command
set -e

# Use first argument as build task
GIT_DIR="$1"

# Get working directory
PATH_TO_SOURCE_SCRIPT="${BASH_SOURCE[0]}"
PATH_TO_SOURCE_DIR="$( cd "$( dirname "${SOURCE}" )" && pwd )"
PATH_TO_ROOT_DIR="$(git rev-parse --show-toplevel)"

# Build version string
BUILD_TIMESTAMP="$(date +"%Y-%m-%d-%r-%Z")"
BUILD_TIMESTAMP="${BUILD_TIMESTAMP/ /-}"
GIT_BRANCH="$(git symbolic-ref --short -q HEAD || echo 'HEAD')"
GIT_TAG="$(git describe --always)"
GIT_USER="$(git show --quiet --pretty=format:'%an' HEAD)"


BUILD_VERSION="[${BUILD_TIMESTAMP}]-[${GIT_BRANCH}]-[${GIT_TAG}]-[${GIT_USER}]"

echo $BUILD_VERSION
