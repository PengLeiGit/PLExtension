#
# Be sure to run `pod lib lint PLExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PLExtension'
  s.version          = '0.1.3'
  s.summary          = '组件类扩展'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/PengLeiGit/PLExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PengLeiGit' => 'jeanhead@126.com' }
  s.source           = { :git => 'https://github.com/PengLeiGit/PLExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'

  # 扩展
  s.subspec 'UIView' do |ss|
      ss.source_files = "PLExtension/Classes/UIView+Extension.swift"
  end
  
  
  s.subspec 'Bundle' do |ss|
      ss.source_files = "PLExtension/Classes/Bundle+Extension.swift"
  end
  
  s.subspec 'String' do |ss|
      ss.source_files = "PLExtension/Classes/String+Extension.swift"
  end
  
  s.subspec 'Int' do |ss|
      ss.source_files = "PLExtension/Classes/Int+Extension.swift"
  end
  
  s.subspec 'Double' do |ss|
      ss.source_files = "PLExtension/Classes/Double+Extension.swift"
  end
  
  s.subspec 'NSNumber' do |ss|
      ss.source_files = "PLExtension/Classes/NSNumber+Extension.swift"
  end
  
  s.subspec 'Array' do |ss|
      ss.source_files = "PLExtension/Classes/Array+Extension.swift"
  end
  
  s.subspec 'UIColor' do |ss|
      ss.source_files = "PLExtension/Classes/UIColor+Extension.swift"
  end
  
  s.subspec 'UIDevice' do |ss|
      ss.source_files = "PLExtension/Classes/UIDevice+Extension.swift"
  end
  
  s.subspec 'UIFont' do |ss|
      ss.source_files = "PLExtension/Classes/UIFont+Extension.swift"
  end
  
  s.subspec 'UIImage' do |ss|
      ss.source_files = "PLExtension/Classes/UIImage+Extension.swift"
      ss.dependency 'PLExtension/Bundle'
  end
  
  s.subspec 'UserDefaults' do |ss|
      ss.source_files = "PLExtension/Classes/UserDefaults+Extension.swift"
  end
  
  s.subspec 'UIBarButtonItem' do |ss|
      ss.source_files = "PLExtension/Classes/UIBarButtonItem+Extension.swift"
  end
  
  
  
  s.subspec 'DispatchQueue' do |ss|
      ss.source_files = "PLExtension/Classes/DispatchQueue+Extension.swift"
  end
  
  s.subspec 'NotificationCenter' do |ss|
      ss.source_files = "PLExtension/Classes/NotificationCenter+Extension.swift"
  end
  
  s.subspec 'NSMutableAttributedString' do |ss|
      ss.source_files = "PLExtension/Classes/NSMutableAttributedString+Extension.swift"
  end
end
