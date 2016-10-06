
Pod::Spec.new do |s|

  s.name         = "SwiftyAttributes"
  s.version      = "2.0"
  s.summary      = "Swift extensions that make it a breeze to work with attributed strings."

  s.description  = <<-DESC

  SwiftyAttributes provides extensions for the String and NSAttributedString classes that make it easier to create attributed strings.

  DESC

  s.homepage     = "https://github.com/eddiekaiger/SwiftyAttributes"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Eddie Kaiger" => "eddiekaiger@gmail.com" }
  s.source       = { :git => "https://github.com/eddiekaiger/SwiftyAttributes.git", :tag => "v2.0" }
  s.source_files = "SwiftyAttributes.swift"
  s.platform     = :ios, '8.0'

end
