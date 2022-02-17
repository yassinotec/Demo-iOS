#!/usr/bin/env make -f

.PHONY: deploy install-dependencies install-gems install-pods update-dependencies update-gems update-pods build clean deply deploy-% upload-to-testflight docs setup

include .env

# Targets

print-environment:
	@echo $(wildcard ./.env)
	@echo APP_IDENTIFIER = "${APP_IDENTIFIER}"
	@echo APP_NAME = "${APP_NAME}"
	@echo FL_APPLE_ID = "${FL_APPLE_ID}"
	@echo GIT_BRANCH = "${GIT_BRANCH}"
	@echo ITC_TEAM_ID = "${ITC_TEAM_ID}"
	@echo LANGUAGE = "${LANGUAGE}"
	@echo TEAM_ID = "${TEAM_ID}"
	@echo TEAM_NAME = "${TEAM_NAME}"
	@echo XCODE_PROJECT = "${XCODE_PROJECT}"
	@echo XCODE_SCHEME = "${XCODE_SCHEME}"
	@echo XCODE_TARGET = "${XCODE_TARGET}"
	@echo XCODE_UITESTS_SCHEME = "${XCODE_UITESTS_SCHEME}"
	@echo XCODE_WORKSPACE = "${XCODE_WORKSPACE}"

clean: command-exists-bundle
	bundle clean
	bundle exec pod cache clean --all
	bundle exec fastlane run clean_build_artifacts
	bundle exec fastlane run clear_derived_data

install-dependencies: install-gems install-pods
	@echo Finished installing dependencies ...

install-gems: command-exists-bundle
	@echo Updating bundler ...
	gem update bundler ${VERBOSE}
	@echo Installing gems ...
	# Set local gem installation to main gems only
ifdef CI
	@echo Configure Bundler for CI ...
	bundle config unset --local clean
	bundle config set --local without development
	bundle config set --local deployment true
else
	@echo Configure Bundler for development ...
	# bundle config set --local clean true
	bundle config unset --local without
	bundle config unset --local deployment
endif
	# Install bundles with multiple jobs for performance
	bundle install --jobs 8 --retry 3 ${VERBOSE}

install-pods: command-exists-bundle
	@echo Installing pods ...
	bundle exec pod install --repo-update ${VERBOSE}

force-update-dependencies: force-update-gems force-update-pods
	@echo Force update dependencies ...

force-update-gems: remove-gemfile-lock update-gems
	@echo Force update gems ...

remove-gemfile-lock:
	@echo Remove Gemfile.lock
	rm -fv Gemfile.lock

force-update-pods: remove-podfile-lock update-pods
	@echo Force update pods ...

remove-podfile-lock:
	@echo Remove Podfile.lock
	rm -fv Podfile.lock

update-dependencies: update-gems update-pods
	@echo Finished updating dependencies ...

update-gems: command-exists-bundle
	@echo Updating gems ...
	bundle update

update-pods: command-exists-bundle
	@echo Updating pods ...
	bundle exec pod update ${VERBOSE}

build: generate-ipa-file
	@echo building app ...

generate-ipa-file: command-exists-bundle
	@echo building ".ipa" file ...
	bundle exec fastlane generate_ipa_file

generate-app-file: command-exists-bundle
	@echo building ".app" file ...
	bundle exec fastlane generate_app_file

deploy: deploy-appstore

deploy-beta: deploy-build-beta

deploy-next-generation: deploy-build-next-generation

deploy-appstore: deploy-build-appstore

deploy-build-%: install-gems
	@echo deploying app \(incrementing build for $(*)\) ...
	bundle exec fastlane beta build_type:build --env $(*) ${VERBOSE}

deploy-patch-%: install-gems
	@echo deploying app \(incrementing patch\) ...
	bundle exec fastlane beta build_type:patch --env $(*) ${VERBOSE}

deploy-minor-%: install-gems
	@echo deploying app \(incrementing minor\) ...
	bundle exec fastlane beta build_type:minor --env $(*) ${VERBOSE}

deploy-major-%: install-gems
	@echo deploying app \(incrementing major\) ...
	bundle exec fastlane beta build_type:major --env $(*) ${VERBOSE}

increment_build_number:
	@echo Incrementing build number app ...
	bundle exec fastlane increment_version_with build_type:build commit_version_bump:true

upload-to-testflight:
	@echo Uploading build to TestFlight ...
	bundle exec fastlane deploy_to_testflight ${VERBOSE}

swiftgen:
	Pods/SwiftGen/bin/swiftgen

lint:
	Pods/SwiftLint/swiftlint

lint-fix:
	Pods/SwiftLint/swiftlint --fix --format

renew-push-certificate:
	bundle exec fastlane renew_push_certificate

docs:
	@echo Generating documentation ...
	bundle exec fastlane generate_docs

setup:
	./setup.sh

# Convenience targets ############################################

command-exists-%:
	@hash $(*) > /dev/null 2>&1 || \
		(echo "ERROR: '$(*)' must be installed before running this target.\nPlease run 'make setup' and try again."; exit 1)
