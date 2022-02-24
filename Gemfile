# frozen_string_literal: true

source 'https://rubygems.org'

# ruby '~> 2.6.8'

# Main gems
gem 'cocoapods'
gem 'fastlane'

# Development gems
group :development do
	gem 'danger'
	gem 'debase', '>= 0.2.5.beta2'
	gem 'jazzy'
	gem 'linterbot'
	gem 'reek'
	gem 'rubocop'
	gem 'ruby-debug-ide'
	gem 'solargraph'
	gem 'xcodeproj'
	gem 'xcpretty'
end

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
