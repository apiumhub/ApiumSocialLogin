#
# Be sure to run `pod lib lint ApiumSocialLogin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'ApiumSocialLogin'
    s.version          = '0.1.0'
    s.summary          = 'ApiumSocialLogin is a helper api to authenticate users using Social Networks like Facebook and Google.'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    ApiumSocialLogin (0.1.0) is a helper api to authenticate users using Social Networks like Facebook and Google.
    DESC
    
    s.homepage         = 'https://github.com/apiumhub/ApiumSocialLogin'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'carloscarrera' => 'carloscarrera.sorribes@gmail.com' }
    s.source           = { :git => 'https://github.com/apiumhub/ApiumSocialLogin.git', :tag => s.version.to_s }

    s.ios.deployment_target = '9.0'
    
    s.static_framework = true

    s.source_files = 'Classes/**/*.{h,m,swift}'
    s.dependency  'Bolts'
    s.dependency  'FacebookCore'
    s.dependency  'FacebookLogin'
    s.dependency  'FacebookShare'
    s.dependency 'GoogleSignIn'

    # s.resource_bundles = {
    #   'ApiumSocialLogin' => ['ApiumSocialLogin/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
