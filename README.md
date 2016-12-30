# WebRTC iOS framework

![](https://img.shields.io/cocoapods/v/WebRTC.svg?maxAge=100) ![](https://img.shields.io/cocoapods/dw/WebRTC.svg?maxAge=100)
![](https://img.shields.io/cocoapods/l/WebRTC.svg?maxAge=100)

[__!!!__] Please report all WebRTC related (not specific to this binary build) bugs and questions to [discussion group](https://groups.google.com/forum/#!forum/discuss-webrtc) or [official bug tracker](https://bugs.chromium.org/p/webrtc/issues/list)

# Contents

- [Installation](#installation)
  - [Unstable versions](#unstable-versions)
- [Usage](#usage)
- [Bitcode](#bitcode)
- [Information](#information)
- [Links](#links)

# Installation

__Cocoapods__ (add to Podfile):

```ruby
pod "WebRTC"
```

__Carthage__ (add to Cartfile):

```
github "Anakros/WebRTC"
```

__Manual__: just download framework from [the latest release](https://github.com/Anakros/WebRTC/releases/latest) and copy it to your project

>You can only use the binary release, because the whole WebRTC repository takes ~12Gb of disk space

## Unstable versions

__Cocoapods__ (will install specified unstable version or _any_ higher version):
```ruby
pod "WebRTC", ">= 56.0.14835-beta"
```

__Carthage__ (there is no way to auto-update to the latest unstable version at the current moment, so you should specify [corresponding version tag](https://github.com/Anakros/WebRTC/tags)):
```
github "Anakros/WebRTC" "56.0.14835-beta"
```

# Usage

## Swift
```swift
import WebRTC

let device = UIDevice.string(for: UIDevice.deviceType())

print(device)
print(RTCInitializeSSL())
```

## Objective-C
```objc
@import WebRTC;

NSString *device = [UIDevice stringForDeviceType:[UIDevice deviceType]];

NSLog(@"%@", device);
NSLog(@"%d", RTCInitializeSSL());
```

# Bitcode

Bitcode isn't supported in the upstream for now. So you should disable it in the project build settings.

# Information

Built from `https://chromium.googlesource.com/external/webrtc/` using `webrtc/build/ios/build_ios_libs.sh` script without any modifications.

# Links

[WebRTC Homepage](https://webrtc.org/)

[WebRTC discussion group](https://groups.google.com/forum/#!forum/discuss-webrtc)

[CocoaDocs](http://cocoadocs.org/docsets/WebRTC/)

[CocoaPods Page](https://cocoapods.org/pods/WebRTC)

[WebRTC Bug Tracker](https://bugs.chromium.org/p/webrtc/issues/list)
