//
//  SettingViewController.swift
//  Tips Calculater
//
//  Created by User on 6/24/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var tipControl: UISegmentedControl!
    @IBOutlet var partySize: UILabel!
    @IBOutlet var storeForHowLong: UILabel!
    
    var index: Int = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        index = tipControl.selectedSegmentIndex
        
        for (index, item) in ModelStore.shared.tipPercentages.enumerated() {
            tipControl.setTitle("\(item * 100)%", forSegmentAt: index)
        }
        
        partySize.text = "😎x\(ModelStore.shared.numberOfParty)"
        storeForHowLong.text = "\(ModelStore.shared.storeForHowLong)"
    }
    
    //rest back to default values
    @IBAction func ResetToDefault(_ sender: Any) {
        ModelStore.shared.Rest()
        for (index, item) in ModelStore.shared.tipPercentages.enumerated() {
            tipControl.setTitle("\(item * 100)%", forSegmentAt: index)
        }
        saveToUserDefaults()
    }
    
    //Tip -/+
    @IBAction func decreaseTipRate(_ sender: Any) {
        index = tipControl.selectedSegmentIndex
        let rate = ModelStore.shared.tipPercentages[index] - 0.01
        ModelStore.shared.updateTipPercentage(rate, index)
        saveToUserDefaults()
    }
    //Tip -/+
    @IBAction func increaseTipRate(_ sender: Any) {
        index = tipControl.selectedSegmentIndex
        let rate = ModelStore.shared.tipPercentages[index] + 0.01
        ModelStore.shared.updateTipPercentage(rate, index)
        saveToUserDefaults()
    }

    //Party -/+
    @IBAction func decreasePartySize(_ sender: Any) {
        if ModelStore.shared.numberOfParty > 4 {
            ModelStore.shared.numberOfParty = ModelStore.shared.numberOfParty - 1
        }
        saveToUserDefaults()
    }
    //Party -/+
    @IBAction func increasePartySize(_ sender: Any) {
        if ModelStore.shared.numberOfParty < 12 {
            ModelStore.shared.numberOfParty = ModelStore.shared.numberOfParty + 1
        }
        saveToUserDefaults()
    }
    
    //Remember Entry for how long -/+
    @IBAction func decreaseRememberTime(_ sender: Any) {
        if ModelStore.shared.storeForHowLong > 0 {
            ModelStore.shared.storeForHowLong = ModelStore.shared.storeForHowLong - 1
        }
        saveToUserDefaults()
    }
    //Remember Entry for how long -/+
    @IBAction func increaseRemeberTime(_ sender: Any) {
        if ModelStore.shared.storeForHowLong < 20 {
            ModelStore.shared.storeForHowLong = ModelStore.shared.storeForHowLong + 1
        }
        saveToUserDefaults()
    }
    
    
    
    //save changes to user defaults
    func saveToUserDefaults() {
        tipControl.setTitle("\(ModelStore.shared.tipPercentages[index] * 100)%", forSegmentAt: index)
        partySize.text = "😎x\(ModelStore.shared.numberOfParty)"
        if ModelStore.shared.storeForHowLong == 0 {
            storeForHowLong.text = "Never!"
        } else {
            storeForHowLong.text = "\(ModelStore.shared.storeForHowLong) mins"
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(ModelStore.shared.tipPercentages, forKey: "tipPercentages")
        userDefaults.set(ModelStore.shared.numberOfParty, forKey: "numberOfParty")
        userDefaults.set(ModelStore.shared.storeForHowLong, forKey: "storeForHowLong")
        userDefaults.synchronize()
    }
}
