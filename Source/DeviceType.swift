//
//  DeviceType.swift
//  AppleResChecker
//
//  Created by admin on 11/11/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import Foundation
import UIKit

public struct Device {
    //Emty struct
}

public enum Type: String {
    case iPhone
    case iPad
    case simulator
    case unknown
}

public enum DeviceType: String {
    // For all device iPhone
    case iPhone4
    case iPhone4S
    case iPhone5
    case iPhone5S
    case iPhone5C
    case iPhoneSE
    case iPhone6
    case iPhone6Plus
    case iPhone6s
    case iPhone6sPlus
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    
    // For all device iPad
    case iPadGen5
    case iPadAir
    case iPadAir2
    case iPadPro97inch
    case iPadPro105inch
    case iPadPro129inch
    case iPadPro129inchGen2
    case iPadMini2
    case iPadMini3
    case iPadMini4
    
    // For Simulator
    case simulatorDevice
    case unknow
    public var screen:Screen {
        switch self {
        case .iPhone4,
             .iPhone4S:
            return .screen_3_5_inch
        case .iPhone5,
             .iPhone5C,
             .iPhone5S:
            return .screen_4_0_inch
        case .iPhone6,
             .iPhone6s,
             .iPhone7,
             .iPhone8:
            return .screen_4_7_inch
        case .iPhone6Plus,
             .iPhone6sPlus,
             .iPhone7Plus,
             .iPhone8Plus:
            return .screen_5_5_inch
        case .iPhoneX:
            return .screen_5_8_inch
        case .iPadMini2,
             .iPadMini3,
             .iPadMini4:
            return .screen_7_9_inch
        case .iPadGen5,
             .iPadPro97inch,
             .iPadAir,
             .iPadAir2:
            return .screen_9_7_inch
        case .iPadPro105inch:
            return .screen_10_5_inch
        case .iPadPro129inch,
             .iPadPro129inchGen2:
            return .screen_12_9_inch
        default:
            return .unknow
        }
    }
}


/// Used to determinate device type
extension Device {
    
    /// Return raw device version code string or empty string if any problem appears.
    static public var versionCode: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        if  let info = NSString(bytes: &systemInfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue),
            let code = String(validatingUTF8: info.utf8String!)
        {
            return code
        }
        
        return ""
    }
    
    static public var type: Type {
        let versionCode = Device.versionCode
        
        switch versionCode {
        case "iPhone3,1", "iPhone3,2", "iPhone3,3",
             "iPhone4,1", "iPhone4,2", "iPhone4,3",
             "iPhone5,1", "iPhone5,2",
             "iPhone5,3", "iPhone5,4",
             "iPhone6,1", "iPhone6,2",
             "iPhone7,2", "iPhone7,1",
             "iPhone8,1", "iPhone8,2", "iPhone8,4",
             "iPhone9,1", "iPhone9,2", "iPhone9,3", "iPhone9,4",
             "iPhone10,1","iPhone10,2","iPhone10,3","iPhone10,4","iPhone10,5","iPhone10,6":
            return .iPhone
            
        case "iPad1,1",
             "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4",
             "iPad3,1", "iPad3,2", "iPad3,3",
             "iPad3,4", "iPad3,5", "iPad3,6",
             "iPad4,1", "iPad4,2", "iPad4,3",
             "iPad5,3", "iPad5,4",
             "iPad2,5", "iPad2,6", "iPad2,7",
             "iPad4,4", "iPad4,5", "iPad4,6",
             "iPad4,7", "iPad4,8", "iPad4,9",
             "iPad5,1", "iPad5,2",
             "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8", "Pad7,3", "iPad7,4",
             "iPad6,11", "iPad6,12":

            return .iPad
        case "i386", "x86_64":
            return .simulator
            
        default:
            return .unknown
        }
    }
    
    /// Return `true` for iPhone-s
    static public var isIphone:Bool {
        return (UIDevice.current.userInterfaceIdiom == .phone)
    }
    
    static public var isPhone4: Bool {
        return isPad && screen == .screen_3_5_inch
    }
    
    static public var isPhone4S: Bool {
        return isPad && screen == .screen_3_5_inch
    }
    
    static public var isPhone5: Bool {
        return isPad && screen == .screen_4_0_inch
    }
    
    static public var isPhone5S: Bool {
        return isPad && screen == .screen_4_0_inch
    }
    
    static public var isPhone5c: Bool {
        return isPad && screen == .screen_4_0_inch
    }
    
    static public var isPhone6: Bool {
        return isPad && screen == .screen_4_7_inch
    }
    
    static public var isPhone6Plus: Bool {
        return isPad && screen == .screen_5_5_inch
    }
    
    static public var isPhone6s: Bool {
        return isPad && screen == .screen_4_7_inch
    }
    
    static public var isPhone6SPlus: Bool {
        return isPad && screen == .screen_5_5_inch
    }
    
    static public var isPhone7: Bool {
        return isPad && screen == .screen_4_7_inch
    }
    
    static public var isPhone7Plus: Bool {
        return isPad && screen == .screen_5_5_inch
    }
    
    static public var isPhone8: Bool {
        return isPad && screen == .screen_4_7_inch
    }
    
    static public var isPhone8Plus: Bool {
        return isPad && screen == .screen_5_5_inch
    }
    
    static public var isPhoneX: Bool {
        return isPad && screen == .screen_5_8_inch
    }
    
    /// Return `true` for iPad-s
    static public var isPad: Bool {
        return ( UIDevice.current.userInterfaceIdiom == .pad )
    }
    
    /// Return `true` for iPadPro12.9
    static public var isPadPro12_9: Bool {
        return isPad && screen == .screen_12_9_inch
    }
    
    /// Return `true` for iPadPro10.5
    static public var isPadPro10_5: Bool {
        return isPad && screen == .screen_10_5_inch
    }
    
    static public var isiPadMini: Bool {
        return isPad && screen == .screen_7_9_inch
    }
    
    static public var isiPad9_7inch: Bool {
        return isPad && screen == .screen_9_7_inch
    }
    
    /// Return `true` for Simulator
    static public var isSimulator: Bool {
        return type == .simulator
    }
    
    // MARK: Version
    
    static public var version: DeviceType {
        let versionCode = Device.versionCode
        
        switch versionCode {
        // Phones
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":
            return .iPhone4
            
        case "iPhone4,1", "iPhone4,2", "iPhone4,3":
            return .iPhone4S
            
        case "iPhone5,1", "iPhone5,2":
            return .iPhone5
            
        case "iPhone5,3", "iPhone5,4":
            return .iPhone5C
            
        case "iPhone6,1", "iPhone6,2":
            return .iPhone5S
            
        case "iPhone7,2":
            return .iPhone6
            
        case "iPhone7,1":
            return .iPhone6Plus
            
        case "iPhone8,1":
            return .iPhone6s
            
        case "iPhone8,2":
            return .iPhone6sPlus
            
        case "iPhone8,4":
            return .iPhoneSE
            
        case "iPhone9,1", "iPhone9,3":
            return .iPhone7
            
        case "iPhone9,2", "iPhone9,4":
            return .iPhone7Plus
            
        case "iPhone10,1", "iPhone10,4":
            return .iPhone8
            
        case "iPhone10,2", "iPhone10,5":
            return .iPhone8Plus
            
        case "iPhone10,3", "iPhone10,6":
            return .iPhoneX
            
        // Pads

        case "iPad4,1", "iPad4,2", "iPad4,3":
            return .iPadAir
            
        case "iPad5,3", "iPad5,4":
            return .iPadAir2
    
        case "iPad4,4", "iPad4,5", "iPad4,6":
            return .iPadMini2
            
        case "iPad4,7", "iPad4,8", "iPad4,9":
            return .iPadMini3
            
        case "iPad5,1", "iPad5,2":
            return .iPadMini4
            
        case "iPad6,3", "iPad6,4":
            return .iPadPro97inch
        
        case "iPad6,11", "iPad6,12":
            return .iPadPro105inch
            
        case "iPad6,7", "iPad6,8","Pad7,3", "iPad7,4":
            return .iPadPro129inch
            
        // Simulator
        case "i386", "x86_64":
            return .simulatorDevice
            
        // Unknown
        default:
            return .unknow
        }
    }
}

// Detect status of device when device rotate

extension Device {
    static public var isLandscape: Bool {
        return ( UIApplication.shared.statusBarOrientation == .landscapeLeft
            || UIApplication.shared.statusBarOrientation == .landscapeRight )
    }
    
    static public var isPortrait: Bool {
        return !Device.isLandscape
    }
    
}
