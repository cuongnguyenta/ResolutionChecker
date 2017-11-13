//
//  Screen.swift
//  AppleResChecker
//
//  Created by admin on 11/11/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit

public enum Screen: CGFloat {
    case screen_3_5_inch  = 3.5
    case screen_4_0_inch  = 4.0
    case screen_4_7_inch  = 4.7
    case screen_5_5_inch  = 5.5
    case screen_5_8_inch  = 5.8
    case screen_7_9_inch  = 7.9
    case screen_9_7_inch  = 9.7
    case screen_10_5_inch = 10.5
    case screen_12_9_inch = 12.9
    case unknow           = 0.0
}


/// Comparing Screen and Screen

public func ==(lhs: Screen, rhs: Screen) -> Bool {
    return lhs.rawValue == rhs.rawValue
}

public func <(lhs: Screen, rhs: Screen) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func >(lhs: Screen, rhs: Screen) -> Bool {
    return lhs.rawValue > rhs.rawValue
}

public func <=(lhs: Screen, rhs: Screen) -> Bool {
    return lhs.rawValue <= rhs.rawValue
}

public func >=(lhs: Screen, rhs: Screen) -> Bool {
    return lhs.rawValue >= rhs.rawValue
}

/// Comparing Screen and Device

public func ==(lhs: Screen, rhs: DeviceType) -> Bool {
    return lhs == rhs.screen
}

public func <(lhs: Screen, rhs: DeviceType) -> Bool {
    return lhs < rhs.screen
}

public func >(lhs: Screen, rhs: DeviceType) -> Bool {
    return lhs > rhs.screen
}

public func <=(lhs: Screen, rhs: DeviceType) -> Bool {
    return lhs <= rhs.screen
}

public func >=(lhs: Screen, rhs: DeviceType) -> Bool {
    return lhs >= rhs.screen
}

//Detect screen scale

public enum Scale: CGFloat, Comparable, Equatable {
    case x1      = 1.0
    case x2      = 2.0
    case x3      = 3.0
    case unknown = 0
}

public func ==(lhs: Scale, rhs: Scale) -> Bool {
    return lhs.rawValue == rhs.rawValue
}

public func <(lhs: Scale, rhs: Scale) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func >(lhs: Scale, rhs: Scale) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func <=(lhs: Scale, rhs: Scale) -> Bool {
    return lhs.rawValue <= rhs.rawValue
}

public func >=(lhs: Scale, rhs: Scale) -> Bool {
    return lhs.rawValue >= rhs.rawValue
}

extension Device {
    static public var screen: Screen {
        let size = UIScreen.main.bounds.size
        let height = max(size.width, size.height)
        
        switch height {
        case 480:
            return .screen_3_5_inch
            
        case 568:
            return .screen_4_0_inch
            
        case 667:
            return ( scale == .x3 ? .screen_5_5_inch : .screen_4_7_inch )
            
        case 736:
            return .screen_5_5_inch
            
        case 812:
            return .screen_5_8_inch
            
        case 1024:
            switch version {
            case .iPadMini2, .iPadMini3, .iPadMini4:
                return .screen_7_9_inch
                
            default:
                return .screen_9_7_inch
            }
            
        case 1112:
            return .screen_10_5_inch
            
        case 1366:
            return .screen_12_9_inch
            
        default:
            return .unknow
        }
    }
    
    static public var scale: Scale {
        let scale = UIScreen.main.scale
        
        switch scale {
        case 1.0:
            return .x1
            
        case 2.0:
            return .x2
            
        case 3.0:
            return .x3
            
        default:
            return .unknown
        }
    }
    
    /// Return `true` for retina displays
    static public var isRetina: Bool {
        return scale > Scale.x1
    }
}




