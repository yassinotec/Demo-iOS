#!/usr/bin/env sh
#===============================================================================
#
#          FILE: setup.sh
#
#         USAGE: ./setup.sh
#
#   DESCRIPTION: Development Environment Setup Script
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yassine ElBadaoui,
#  ORGANIZATION: TORANOTC
#       CREATED: 2021/04/26 17:54
#      REVISION:  ---
#===============================================================================

# shellcheck disable=SC3000-SC4000

set -o nounset # Treat unset variables as an error

export PATH="$PATH:/usr/local/bin"

# ENVIRONMENT="${1-dev}"
# BIN_FOLDER='/usr/local/bin'
# GEM_INSTALL="sudo gem install -n ${BIN_FOLDER}"

# Global Variables ##########################################

USER_INFO_SHELL=".userinfo.sh"

# General Functions ##########################################

_command_found() {
	command -v "${1}" >/dev/null 2>&1
}

# Setup Development Environment ##########################################

_save_git_author_info() {
	# shellcheck disable=SC1091
	# shellcheck source=.
	if [ -f "${USER_INFO_SHELL}" ]; then
		source "${USER_INFO_SHELL}"
	fi
	echo "Set user Git author name to \"${GIT_AUTHOR_NAME}\"."
	git config user.name "${GIT_AUTHOR_NAME}"
	echo "Set user Git author email address to \"${GIT_AUTHOR_EMAIL}\"."
	git config user.email "${GIT_AUTHOR_EMAIL}"
}

_read_user_info() {
	# shellcheck disable=SC1091
	# shellcheck source=.
	if [ -f "${USER_INFO_SHELL}" ]; then
		echo "Load ${USER_INFO_SHELL}"
		source "${USER_INFO_SHELL}"
		_fullname="${GIT_AUTHOR_NAME}"
		_email="${GIT_AUTHOR_EMAIL}"
	fi
	if [ -z "${_fullname+x}" ]; then
		printf "Enter your full name: "
		read -r _fullname
		_fullname="$(printf '%s' "${_fullname}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
	fi
	if [ -z ${_email+x} ]; then
		printf "Enter your work e-mail address: "
		read -r _email
		_email="$(printf '%s' "${_email}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
	fi
	if [ ! -f "${USER_INFO_SHELL}" ]; then
		cat <<-EOT >"${USER_INFO_SHELL}"
			GIT_AUTHOR_NAME="${_fullname}"
			GIT_AUTHOR_EMAIL=${_email}
			GIT_COMMITTER_NAME="${_fullname}"
			GIT_COMMITTER_EMAIL=${_email}
		EOT
		echo "Saved user info into \"${USER_INFO_SHELL}\""
	fi
	echo "This script will be using the following information in this session:"
	echo "Full Name: \"${_fullname}\""
	echo "Email: \"${_email}\""
	echo
}

# Generate SSH keys if needed
_generate_ssh_keys() {
	local RSA_KEY_PATH=~/.ssh/id_rsa
	local ED25519_KEY_PATH=~/.ssh/id_ed25519
	if [ ! -f ${RSA_KEY_PATH} ]; then
		echo "Generating RSA Key ..."
		ssh-keygen -t rsa -b 4096 -f ${RSA_KEY_PATH} -C "${GIT_AUTHOR_EMAIL}" -N ''
	fi
	if [ ! -f ${ED25519_KEY_PATH} ]; then
		echo "Generating Ed25519 Key ..."
		ssh-keygen -t ed25519 -f ${ED25519_KEY_PATH} -C "${GIT_AUTHOR_EMAIL}" -N ''
	fi
}

# Install Homebrew and Homebrew formulas
_homebrew_formula_install() {
	hash brew >/dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	brew bundle --no-lock --verbose
}

# Install Xcode Command Line Tools
_xcode_commandline_tools_install() {
	xcode-select --install
	sleep 1
	osascript <<-EOD
		tell application "System Events"
			tell process "Install Command Line Developer Tools"
				keystroke return
				click button "Agree" of window "License Agreement"
			end tell
		end tell
	EOD
	if ! xcode-select -p >/dev/null 2>&1; then
		echo "Installing Xcode Command Line Tools ..."
		xcode-select --install
	fi
}

# Install Git LFS hooks
_git_lfs_install() {
	git lfs install
}

# Install Bundler
_bundle_install_from_gemfile() {
	local VENDOR_PATH='vendor/bundle'
	echo
	if ! _command_found bundle; then
		echo "Installing Bundler ..."
		echo "Please input the login password for the following user: \"${USER}\" (The user should have administrative privilege):"
		# ${GEM_INSTALL} bundler
		gem install bundler
	fi
	echo "Updating Bundler ..."
	bundle update --bundler
	echo "Installing needed commands ..."
	bundle install --path="${VENDOR_PATH}" --verbose
}

# Install cocoapods pods
_pod_install() {
	echo
	echo "Installing pods ..."
	bundle exec pod install --repo-update --verbose
}

# Main ##########################################

_additional_homebrew_formulas_install() {
	brew bundle --file=/dev/stdin <<<EOT
	brew "rbenv"
	EOT
	gem install bundler
}

_main() {
	_read_user_info
	_save_git_author_info
	# _additional_homebrew_formulas_install
	_generate_ssh_keys
	# _xcode_commandline_tools_install
	_homebrew_formula_install
	_bundle_install_from_gemfile
	_pod_install
	_git_lfs_install
}

_main
