
Pod::Spec.new do |s|

  s.name         = "SwiftyAttributes"
  s.version      = "1.0"
  s.summary      = "Swift extensions that make it a breeze to work with attributed strings."

  s.description  = <<-DESC

  SwiftyAttributes provides extensions for the String and NSAttributedString classes that make it easier to create attributed strings.

  DESC

  s.homepage     = "https://github.com/eddiekaiger/SwiftyAttributes"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Eddie Kaiger" => "eddiekaiger@gmail.com" }
  s.source       = { :git => "https://github.com/eddiekaiger/SwiftyAttributes.git", :tag => "1.0" }
  s.source_files = "SwiftyAttributes.swift"
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'

end
