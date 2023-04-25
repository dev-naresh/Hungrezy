//
//  ArrayStringConversions.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

class ArrayStringConversions {
    static func intArrayToString(_ arr: [Int]) -> String {
        var str = ""

        for i in 0..<arr.count {
            if i < arr.count - 1 {
                str += String(arr[i]) + ","
            } else {
                str += String(arr[i])
                return str
            }
        }
        
        return str
    }

    static func stringToIntArray(_ string: String) -> [Int] {
        let strArray = string.split(separator: ",")
        var intArray: [Int] = []
        
        for i in strArray {
            guard let num = Int(i) else {
                return []
            }
            
            intArray.append(num)
        }
        
        return intArray
    }

    static func stringArrayToString(_ arr: [String]) -> String {
        var str = ""

        for i in 0..<arr.count {
            if i < arr.count - 1 {
                str += arr[i] + ","
            } else {
                str += arr[i]
                return str
            }
        }
        
        return str
    }
    
    static func stringToStringArray(_ string: String) -> [String] {
        let strArray = string.split(separator: ",")
        var array: [String] = []
        
        for i in strArray {
            array.append(String(i))
        }
        
        return array
    }
}
