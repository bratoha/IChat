# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'IChat' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  inhibit_all_warnings!

  # Pods for IChat
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
  pod 'GoogleSignIn'
  pod 'SDWebImage', '~> 5.0'
  
  post_install do |pi|
      pi.pods_project.targets.each do |t|
        t.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
        end
      end
  end
end
