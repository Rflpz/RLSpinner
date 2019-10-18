#
# Be sure to run `pod lib lint RLSpinner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RLSpinner'
  s.version          = '0.1.8'
  s.summary          = 'Nice spinner, easy implementation'
  s.swift_version    = '5.0'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/Rflpz/RLSpinner'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rafael Lopez' => 'rflpzdev@gmail.com' }
  s.source           = { :git => 'https://github.com/Rflpz/RLSpinner.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'RLSpinner/Classes/**/*'
  s.resource_bundles = {
    'RLSpinner' => ['RLSpinner/Assets/*.*']
  }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'QuartzCore'
  # s.dependency 'AFNetworking', '~> 2.3'
end
