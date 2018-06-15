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
    s.description      = <<-DESC
    ApiumSocialLogin (0.1.0) is a helper api to authenticate users using Social Networks like Facebook and Google.
    DESC
    
    s.homepage         = 'https://github.com/apiumhub/ApiumSocialLogin'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'carloscarrera' => 'carloscarrera.sorribes@gmail.com' }
    s.source           = { :git => 'git@github.com:apiumhub/Apium-PodSpecs.git', :tag => s.version.to_s }

    s.ios.deployment_target = '9.0'
    s.static_framework = true
    s.source_files = 'Classes/**/*.{h,m,swift}'
    s.dependency  'Bolts'
    s.dependency  'FacebookCore'
    s.dependency  'FacebookLogin'
    s.dependency  'FacebookShare'
    s.dependency  'GoogleSignIn'
end
