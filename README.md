# WebRTC iOS framework

![](https://img.shields.io/cocoapods/v/WebRTC.svg?maxAge=100) ![](https://img.shields.io/cocoapods/dw/WebRTC.svg?maxAge=100)
![](https://img.shields.io/cocoapods/l/WebRTC.svg?maxAge=100)

[__!__] Please report all WebRTC related (not specific to this binary build) bugs and questions to [discussion group](https://groups.google.com/forum/#!forum/discuss-webrtc) or [official bug tracker](https://bugs.chromium.org/p/webrtc/issues/list). You more likely to find professional help there.

# Contents

- [Installation](#installation)
- [Usage](#usage)
- [Information](#information)
- [Links](#links)

# Installation

[__!__] Bitcode is supported by the upstream, but Google source code builder (GN) produces ~700Mb binary with enabled bitcode, so it's hardly possible to distribute as a framework via CocoaPods/Carthage and that's why bitcode is __disabled__ in my build. Follow corresponding issue there: https://bugs.chromium.org/p/webrtc/issues/detail?id=5085

Make sure to disable bitcode for your project: Go to your project's settings and find the *Build settings* tab, check *All* and search for *bitcode*, then set it to __No__.

If you encounter linker errors, try to add the framework to [embedded binaries section](https://github.com/Anakros/WebRTC/issues/18#issuecomment-271535794).

__CocoaPods__ (add to Podfile):

```ruby
pod "WebRTC"
```

__Carthage__ (add to Cartfile):

```
github "Anakros/WebRTC"
```

__Manual__: just download framework from [the latest release](https://github.com/Anakros/WebRTC/releases/latest) and copy it to your project

>You can only use the binary release, because the whole WebRTC repository takes ~12Gb of disk space

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

>Check out [Official Example App](https://webrtc.googlesource.com/src/+/master/examples/objc/AppRTCMobile/)!

# Information

Built from `https://chromium.googlesource.com/external/webrtc/` using `tools_webrtc/ios/build_ios_libs.py` script with following modifications (to enable x86 architecture):

```diff
diff --git a/tools_webrtc/ios/build_ios_libs.py b/tools_webrtc/ios/build_ios_libs.py
index 734f3e216..e6f250c97 100755
--- a/tools_webrtc/ios/build_ios_libs.py
+++ b/tools_webrtc/ios/build_ios_libs.py
@@ -165,8 +165,6 @@ def main():

   # Ignoring x86 except for static libraries for now because of a GN build issue
   # where the generated dynamic framework has the wrong architectures.
-  if 'x86' in architectures and args.build_type != 'static_only':
-    architectures.remove('x86')

   # Build all architectures.
   for arch in architectures:
```

# Links

[Official Example App](https://webrtc.googlesource.com/src/+/master/examples/objc/AppRTCMobile/)

[Official WebRTC Source Code Repository](https://webrtc.googlesource.com/src/)

[WebRTC Homepage](https://webrtc.org/)

[WebRTC Discussion Group](https://groups.google.com/forum/#!forum/discuss-webrtc)

[WebRTC Bug Tracker](https://bugs.chromium.org/p/webrtc/issues/list)

[CocoaDocs](http://cocoadocs.org/docsets/WebRTC/)

[CocoaPods Page](https://cocoapods.org/pods/WebRTC)
