# Apple Devices Resolutions Checker
[![Build Status](https://travis-ci.org/jack3010/Apple-Devices-Resolutions-Checker.svg?branch=master)](https://travis-ci.org/jack3010/Apple-Devices-Resolutions-Checker)
[![Version](https://img.shields.io/cocoapods/v/ResolutionChecker.svg?style=flat)](http://cocoapods.org/pods/ResolutionChecker)
[![License](https://img.shields.io/cocoapods/l/ResolutionChecker.svg?style=flat)](http://cocoapods.org/pods/ResolutionChecker)
[![Platform](https://img.shields.io/cocoapods/p/ResolutionChecker.svg?style=flat)](http://cocoapods.org/pods/ResolutionChecker)
![](https://img.shields.io/badge/Supported-iOS9-4BC51D.svg?style=flat)
![](https://img.shields.io/badge/Swift4-compatible-4BC51D.svg?style=flat)

Easy to detect iOS device or version in your code

## Features

- [x] [Check screen orientation](https://github.com/jack3010/ResolutionChecker#check-screen-orientation)
- [x] [Detect device type](https://github.com/jack3010/ResolutionChecker#detect-device-type)
- [x] [Detect device version](https://github.com/jack3010/ResolutionChecker#detect-device-version)
- [x] [Check iPhone/iPad/Simulator](https://github.com/jack3010/ResolutionChecker#check-iphone/ipad/simulator)
- [x] [Detect iOS version](https://github.com/jack3010/ResolutionChecker#detect-ios-version)

## Requirements

- iOS 9.0+
- Xcode 9
- Swift 4

### Check screen orientation
If you want to check status of device when the device rotate. You can type a command: 

```swift
override func viewDidLoad() {
   super.viewDidLoad()
   // Check status of screen orientation
   print(String(Device.isLandscape))
}
```
The command `Device.isLandscape` will return `Bool` value
### Detect device type
Device resolution checker helps you detect what kind of device is running app. 
```swift
Device.type.rawValue
```
Output: `iPhone`
### Detect device version
You also want to detect exact version like iPhone6, iPhone6 Plus,..etc. Type the command: 
```swift
Device.version.rawValue
```
### Check iPhone/iPad/Simulator
```swift 
Device.isIphone
Device.isPad
Device.isPadPro10_5
Device.isPadPro12_9
Device.isSimulator
Device.isPhoneX
```

### Detect iOS version
```swift
String(describing: Device.iosVersion)
```
Moreover, you also compare device screen. 
```swift
if Screen.screen_3_5_inch < Screen.screen_4_0_inch {
   print("true")
}
```

### TO DO NEXT

- [x] Compare version iOS.



