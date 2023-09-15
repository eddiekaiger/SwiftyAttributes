
Pod::Spec.new do |s|

  s.name         = "SwiftyAttributes"
  s.version      = "5.4.0"
  s.summary      = "A Swifty API for attributed strings."

  s.description  = <<-DESC

  SwiftyAttributes provides a clean, Swifty API for dealing with NSAttributedStrings.

  DESC

  s.homepage     = "https://github.com/eddiekaiger/SwiftyAttributes"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Eddie Kaiger" => "eddiekaiger@gmail.com" }
  s.source       = { :git => "https://github.com/eddiekaiger/SwiftyAttributes.git", :tag => "v" + s.version.to_s }
  
  s.source_files = "SwiftyAttributes/Sources/common/*.swift"
  s.ios.source_files = "SwiftyAttributes/Sources/iOS_tvOS/*.swift"
  s.tvos.source_files = "SwiftyAttributes/Sources/iOS_tvOS/*.swift"
  s.osx.source_files = "SwiftyAttributes/Sources/macOS/*.swift"

  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.13'

  s.swift_versions = ['5.6', '5.7', '5.8']
end
