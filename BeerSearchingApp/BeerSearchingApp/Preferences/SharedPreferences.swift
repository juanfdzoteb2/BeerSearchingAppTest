//
//  SharedPreferences.swift
//  BeerSearchingApp
//
//  Created by Juan Fernández Otero on 30/5/21.
//

import Foundation

final class SharedPreferences{

    static let shared = SharedPreferences()
    
    private let preferences = UserDefaults.standard
    
    private let bitternessHigherOrEqualKey = "bitternessHigherOrEqual"
    
    private let filterBitternessBoolKey = "filterBitternessBool"
    
    
    func readBitternessValue() -> Int{

        if preferences.object(forKey: bitternessHigherOrEqualKey) == nil {
            return 50 // central value
        } else {
            let currentLevel = preferences.integer(forKey: bitternessHigherOrEqualKey)
            return currentLevel
        }

    }
    
    func writeBitternessValue(value: Int){
        preferences.set(value, forKey: bitternessHigherOrEqualKey)
    }
    
    
    func readFilterBitternessBool() -> Bool{

        if preferences.object(forKey: filterBitternessBoolKey) == nil {
            return false // default value
        } else {
            let boolValue = preferences.bool(forKey: filterBitternessBoolKey)
            return boolValue
        }

    }
    
    
    
    func writefilterBitternessBool(value: Bool){
        preferences.set(value, forKey: filterBitternessBoolKey)
    }






}
