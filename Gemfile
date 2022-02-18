# frozen_string_literal: true

source 'https://rubygems.org'

gem 'cocoapods'
gem 'fastlane'

group :development do
	gem 'danger'
	gem 'jazzy'
	gem 'linterbot'
	gem 'reek'
	gem 'rubocop'
	gem 'solargraph'
	gem 'xcodeproj'
	gem 'xcpretty'
end

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
