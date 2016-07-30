Pod::Spec.new do |s|
  s.name         = "WebRTC"
  s.version      = "1.0.13581"
  s.summary      = "WebRTC SDK for iOS"
  s.description  = <<-DESC
    WebRTC is a free, open project that provides browsers and mobile
    applications with Real-Time Communications (RTC) capabilities via simple
    APIs.
                   DESC
  s.homepage     = "http://webrtc.org/"
  s.license      = "BSD"
  s.author       = "Google Inc."
  s.source       = { :git => "https://github.com/Anakros/webrtc-ios-dynamic.git", :tag => s.version }
  s.platform     = :ios, "8.0"

  s.source_files        = "WebRTC.framework/Headers/**/*.h"
  s.public_header_files = "WebRTC.framework/Headers/**/*.h"
  s.vendored_frameworks = "WebRTC.framework"
end
