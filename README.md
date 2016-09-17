# WebRTC iOS framework

![](https://img.shields.io/cocoapods/v/WebRTC.svg?maxAge=100) ![](https://img.shields.io/cocoapods/dw/WebRTC.svg?maxAge=100)
![](https://img.shields.io/cocoapods/l/WebRTC.svg?maxAge=100)

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
github "Anakros/WebRTC-iOS"
```

__Manual__: just download framework from [the latest release](https://github.com/Anakros/WebRTC-iOS/releases/latest) and copy it to your project

>You can only use the binary release, because the whole WebRTC repository is ~12Gb of disk space

## Unstable versions

__Cocoapods__ (will install specified unstable version or _any_ higher version):
```ruby
pod "WebRTC", ">= 14093.0.0-master"
```

__Carthage__ (there is no way to auto-update to the latest unstable version at the current moment, so you should specify [corresponding version tag](https://github.com/Anakros/WebRTC-iOS/tags)):
```
github "Anakros/WebRTC-iOS" "14093.0.0-master"
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

Built from `https://chromium.googlesource.com/external/webrtc/` using `webrtc/build/ios/build_ios_libs.sh` script.

Following patches applied:

> Hardware H264 support enabled

```diff
diff --git a/webrtc/build/common.gypi b/webrtc/build/common.gypi
index 36a2dae..1332809 100644
--- a/webrtc/build/common.gypi
+++ b/webrtc/build/common.gypi
@@ -155,7 +155,7 @@
 
     # Enable this to use HW H.264 encoder/decoder on iOS/Mac PeerConnections.
     # Enabling this may break interop with Android clients that support H264.
-    'use_objc_h264%': 0,
+    'use_objc_h264%': 1,
 
     # Enable this to prevent extern symbols from being hidden on iOS builds.
     # The chromium settings we inherit hide symbols by default on Release

```

> Provide default implementation for WebRTC metrics

```diff
diff --git a/webrtc/system_wrappers/system_wrappers.gyp b/webrtc/system_wrappers/system_wrappers.gyp
index ea8fdb6..4ff2bab 100644
--- a/webrtc/system_wrappers/system_wrappers.gyp
+++ b/webrtc/system_wrappers/system_wrappers.gyp
@@ -44,6 +44,7 @@
         'include/timestamp_extrapolator.h',
         'include/trace.h',
         'include/utf_util_win.h',
+        'include/metrics_default.h',
         'source/aligned_malloc.cc',
         'source/atomic32_win.cc',
         'source/clock.cc',
@@ -76,6 +77,7 @@
         'source/trace_posix.h',
         'source/trace_win.cc',
         'source/trace_win.h',
+        'source/metrics_default.cc',
       ],
       'conditions': [
         ['enable_data_logging==1', {
```

# Links

[WebRTC Homepage](https://webrtc.org/)

[WebRTC discussion group](https://groups.google.com/forum/#!forum/discuss-webrtc)

[CocoaDocs](http://cocoadocs.org/docsets/WebRTC/)

[CocoaPods Page](https://cocoapods.org/pods/WebRTC)

[WebRTC Bug Tracker](https://bugs.chromium.org/p/webrtc/issues/list)
