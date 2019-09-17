require "json"
package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name             = 'react-native-doc-preview'
  s.version          = package['version']
  s.summary          = package['description']
  s.homepage         = 'https://github.com/shimohq/react-native-doc-preview'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lisong' => 'lisong@shimo.im' }
  s.source           = { :git => 'https://github.com/shimohq/react-native-doc-preview.git', :tag => "v#{s.version}" }

  s.ios.deployment_target = '8.0'
  
  s.source_files = 'ios/**/*.{h,m,mm}'
  
  s.dependency 'React'

end
