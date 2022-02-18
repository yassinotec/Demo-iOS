# frozen_string_literal: true

# Uncomment the next line to define a global platform for your project
platform :ios, '14.7'

target 'Demo' do
	# Comment the next line if you don't want to use dynamic frameworks
	use_frameworks!

	# ignore all warnings from all pods
	inhibit_all_warnings!

	# Pods for Demo
	pod 'SwiftLint'
	pod 'SwiftGen'

	target 'DemoTests' do
		inherit! :search_paths
		# Pods for testing
	end

	target 'DemoUITests' do
		# Pods for testing
	end
end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
			config.build_settings.delete 'ONLY_ACTIVE_ARCH'
			# config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
		end
	end
end
