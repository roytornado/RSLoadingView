#
# Be sure to run `pod lib lint RSLoadingView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RSLoadingView'
  s.version          = '1.0.0'
  s.summary          = 'Awesome loading animations using 3D engine written with Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
`RSLoadingView` bring your app to the new age of loading animations using 3D engine.
- Written with Swift
- Customizable
- Using Apple's SceneKit with OpenGL
- Include HUB feature: show full screen loading HUB with one line of code
- Or use as standalone view
- Configurable in interface builder
                       DESC

  s.homepage         = 'https://github.com/git/RSLoadingView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'git' => 'roytornado@gmail.com' }
  s.source           = { :git => 'https://github.com/git/RSLoadingView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'RSLoadingView/Classes/**/*'
  
  s.resource_bundles = {
    'RSLoadingView' => ['RSLoadingView/Assets/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
