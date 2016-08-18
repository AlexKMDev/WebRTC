# WebRTC iOS framework

![](https://img.shields.io/cocoapods/v/WebRTC.svg?maxAge=2592000) ![](https://img.shields.io/cocoapods/dw/WebRTC.svg?maxAge=2592000)
![](https://img.shields.io/cocoapods/l/WebRTC.svg?maxAge=2592000)

# Installation

__Cocoapods__: add `pod "WebRTC"` to Podfile

__Carthage__: add `github "Anakros/WebRTC-iOS"` to Cartfile

__Manual__: just download framework from [latest release](https://github.com/Anakros/WebRTC-iOS/releases/latest) and copy it to your project

>You can only use binary release, because full WebRTC repository takes ~12Gb of space

## Usage

### Swift
```swift
import WebRTC
```

### Objective-C
```objc
@import WebRTC;
```

## Information

Built from `https://chromium.googlesource.com/external/webrtc/` using `webrtc/build/ios/build_ios_libs.sh` script.

Following patches applied:
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
