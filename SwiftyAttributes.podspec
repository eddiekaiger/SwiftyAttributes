
Pod::Spec.new do |s|

  s.name         = "SwiftyAttributes"
  s.version      = "5.0.0"
  s.summary      = "A Swifty API for attributed strings."

  s.description  = <<-DESC

  SwiftyAttributes provides a clean, Swifty API for dealing with NSAttributedStrings.

  DESC

  s.homepage     = "https://github.com/eddiekaiger/SwiftyAttributes"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Eddie Kaiger" => "eddiekaiger@gmail.com" }
  s.source       = { :git => "https://github.com/eddiekaiger/SwiftyAttributes.git", :tag => "v" + s.version.to_s }
  
  s.source_files = "SwiftyAttributes/Sources/common/*.swift"
  s.osx.source_files = "SwiftyAttributes/Sources/macOS/*.swift"
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

end
