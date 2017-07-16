//
//  ModelStore.swift
//  Tips Calculater
//
//  Created by User on 6/24/17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation

class ModelStore {
    static let shared = ModelStore()
    let defaultTipPercentages = [0.18, 0.2, 0.25]
    let defaultNumberOfParty = 4
    let defaultStoreForHowLong = 10
    
    var tipPercentages:[Double]
    var numberOfParty:Int
    var recordAmounts:[[String:AnyObject]]
    
    //remembering the bill amount across ap restarts
    var storeForHowLong:Int
    var entryTimestamp:Date
    var selectedTipIndex:Int
    var currentBillAmount:String
    
    init() {
        tipPercentages = defaultTipPercentages
        numberOfParty = defaultNumberOfParty
        recordAmounts = []
        
        storeForHowLong = defaultStoreForHowLong
        entryTimestamp = Date()
        selectedTipIndex = 0
        currentBillAmount = ""
        loadTipPercentagesFromUserDefaults()
    }
    
    func updateTipPercentage(_ rate: Double, _ index: Int) {
        tipPercentages[index] = rate
        //print(tipPercentages[index])
    }
    
    //load data from UserDefaults
    func loadTipPercentagesFromUserDefaults() {
        let userDefaults = UserDefaults.standard
        
        if userDefaults.object(forKey: "tipPercentages") != nil {
            tipPercentages = userDefaults.object(forKey: "tipPercentages") as! [Double]
        }
        
        if userDefaults.object(forKey: "numberOfParty") != nil {
            numberOfParty = userDefaults.object(forKey: "numberOfParty") as! Int
        }

        if userDefaults.object(forKey: "recordAmounts") != nil {
            recordAmounts = userDefaults.object(forKey: "recordAmounts") as! [[String:AnyObject]]
            /*
            for i in 0..<recordAmounts.count {
                print("Date: \(recordDates[i]), $: \(recordAmounts[i])")
            }

            */
        }
        
        if userDefaults.object(forKey: "storeForHowLong") != nil {
            storeForHowLong = userDefaults.object(forKey: "storeForHowLong") as! Int
        }
        
        //Restore memorized bill amount
        if userDefaults.object(forKey: "memorizedTimestamp") != nil
            && userDefaults.object(forKey: "memorizedTipIndex") != nil
            && userDefaults.object(forKey: "memorizedAmount") != nil {
            
            let tempTimestamp = userDefaults.object(forKey: "memorizedTimestamp") as! Date
            print("userDef: \(userDefaults.object(forKey: "memorizedTimestamp")) tempTime: \(tempTimestamp.addingTimeInterval(Double(storeForHowLong) * 60.0)), date(): \(Date())")
            
            if tempTimestamp.addingTimeInterval(Double(storeForHowLong) * 60.0) >= Date() {
                entryTimestamp = userDefaults.object(forKey: "memorizedTimestamp") as! Date
                selectedTipIndex = userDefaults.object(forKey: "memorizedTipIndex") as! Int
                currentBillAmount = userDefaults.object(forKey: "memorizedAmount") as! String
            }
        }
    }
    
    func Rest() {
        tipPercentages = defaultTipPercentages
        numberOfParty = defaultNumberOfParty
        storeForHowLong = defaultStoreForHowLong
    }
    
}
