//
//  iOSVersion.swift
//  AppleResChecker
//
//  Created by admin on 11/11/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import Foundation
import UIKit

extension Device {
    public static var iosVersion: iOSVersion {
        return iOSVersion(UIDevice.current.systemVersion)
    }
    
    public struct iOSVersion {
        fileprivate(set) var version: String
        
        public init(_ version: String) {
            let characters = CharacterSet(charactersIn: "01234567890.")
            let string = version.trimmingCharacters(in: characters.inverted)
            let clearedString = version.trimmingCharacters(in: characters)
            
            if clearedString.count > 0 {
                print("WARNING: App version used delimiter wrong: \(version). Will remove it.")
            }
            
            self.version = string
        }
        
        fileprivate var versionNumbers: [String] {
            let characters = CharacterSet(charactersIn: ".")
            var components = version.components(separatedBy: characters)
            
            while true {
                if  let last = components.last,
                    last == "0"
                {
                    components.removeLast()
                    continue
                }
                
                break
            }
            
            return components
        }
    }
}

extension Device.iOSVersion: Equatable {
    
    public static func == (lhs: Device.iOSVersion, rhs: Device.iOSVersion) -> Bool {
        let lComponents = lhs.versionNumbers
        let rComponents = rhs.versionNumbers
        
        guard lComponents.count == rComponents.count else { return false }
        let maxIndex = lComponents.count
        
        for index in 0..<maxIndex {
            if  let lInt = Int(lComponents[index]),
                let rInt = Int(rComponents[index]),
                lInt != rInt
            {
                return false
            }
        }
        
        return true
    }
    
}

extension Device.iOSVersion: Comparable {
    
    public static func < (lhs: Device.iOSVersion, rhs: Device.iOSVersion) -> Bool {
        let lComponents = lhs.versionNumbers
        let rComponents = rhs.versionNumbers
        let maxIndex = max(lComponents.count, rComponents.count)
        
        for index in 0..<maxIndex {
            guard lComponents.count != index else { return true }
            guard rComponents.count != index else { return false }
            
            if  let lInt = Int(lComponents[index]),
                let rInt = Int(rComponents[index])
            {
                if lInt < rInt { return true }
                if lInt > rInt { return false }
            }
        }
        
        return false
    }
}
