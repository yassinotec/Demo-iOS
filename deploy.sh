#!/usr/bin/env sh -
#===============================================================================
#
#          FILE: deploy.sh
#
#         USAGE: ./deploy.sh
#
#   DESCRIPTION: Deploy app from command line.
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yassine ElBadaoui,
#  ORGANIZATION: TORANOTEC K.K.
#       CREATED: 2021/05/06 15:37
#      REVISION:  ---
#===============================================================================

# set -o nounset	# Treat unset variables as an error

_main() {
	ENVIRONMENT="${1:-patch}"
	LANE="beta"
	# fastlane ${LANE} build_type:${ENVIRONMENT}
	bundle exec fastlane ${LANE} build_type:${ENVIRONMENT}
}

_main $@
