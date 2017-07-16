//
//  ViewController.swift
//  Tips Calculater
//
//  Created by User on 6/20/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    var total: Double = 0
    
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var tipControl: UISegmentedControl!

    @IBOutlet var customPartySize: UILabel!
    
    @IBOutlet var dividedAmount1: UILabel!
    @IBOutlet var dividedAmount2: UILabel!
    @IBOutlet var dividedAmount3: UILabel!
    @IBOutlet var dividedAmount4: UILabel!
    
    @IBOutlet var addToRecord: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //ModelStore.shared.loadTipPercentagesFromUserDefaults()
        loadTipPercentagesToSegmentedControl()
        loadNumberOfPartyToCustomPartySize()
        loadMemorizedAmount()
        
        //run calucateTip in viewVillAppear so it will refresh the changes from the setting screen.
        calucateTip("")
        
        //set focus to textField
        billTextField.becomeFirstResponder()
        
    }


    //disappear keyboard when clicked outside of keyboard
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    //calucate Tip
    @IBAction func calucateTip(_ sender: Any) {
        
        let tipPercentages = ModelStore.shared.tipPercentages
        
        let bill = Double(billTextField.text!) ?? 0 //?? 0
        let tip = bill * (tipPercentages[tipControl.selectedSegmentIndex])
        total = bill + tip
        
        tipLabel.text = formatCurrency(value: tip)//String(format: "$%.2f", tip)
        totalLabel.text = formatCurrency(value: total)//String(format: "$%.2f", total)

        divideAmountByParty()
        
        allowAddToRecord()
        
        //save to currentAmount
        ModelStore.shared.entryTimestamp = Date()
        ModelStore.shared.selectedTipIndex = tipControl.selectedSegmentIndex
        ModelStore.shared.currentBillAmount = billTextField.text!
        saveToUserDefaults(item: ModelStore.shared.entryTimestamp, forKey: "memorizedTimestamp")
        saveToUserDefaults(item: ModelStore.shared.selectedTipIndex, forKey: "memorizedTipIndex")
        saveToUserDefaults(item: ModelStore.shared.currentBillAmount, forKey: "memorizedAmount")

    }
    
    //prepare and to save record
    @IBAction func addToRecord(_ sender: Any) {
        let now = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        
        var recordAmounts = [String:AnyObject]()
        
        recordAmounts["date"] = String(formatter.string(from: now)) as AnyObject
        
        recordAmounts["1"] = dividedAmount1.text as AnyObject
        recordAmounts["2"] = dividedAmount2.text as AnyObject
        recordAmounts["3"] = dividedAmount3.text as AnyObject
        recordAmounts["customPartySize"] = "\(ModelStore.shared.numberOfParty)" as AnyObject
        recordAmounts["customPartAmount"] = dividedAmount4.text as AnyObject
        recordAmounts["tipPercentages"] = "\(ModelStore.shared.tipPercentages[tipControl.selectedSegmentIndex] * 100)%" as AnyObject
        recordAmounts["totalAmount"] = totalLabel.text as AnyObject
        
        ModelStore.shared.recordAmounts.append(recordAmounts)

        addToRecord.isEnabled = false
        
        saveToUserDefaults(item: ModelStore.shared.recordAmounts, forKey: "recordAmounts")
        /*
        print(record.date)
        
        for item in ModelStore.shared.records {
            print(item)
            for values in item.partTip {
                print(values)
            }
        }
        */
    }
    
    //load Tip % from ModelStore
    func loadTipPercentagesToSegmentedControl() {
        for (index, item) in ModelStore.shared.tipPercentages.enumerated() {
            tipControl.setTitle("\(item * 100)%", forSegmentAt: index)
        }
    }
    
    //load numberOfParty from ModelStore
    func loadNumberOfPartyToCustomPartySize() {
        customPartySize.text = "😎x\(ModelStore.shared.numberOfParty)"
    }
    
    //load memorizedAmount
    func loadMemorizedAmount() {
        tipControl.selectedSegmentIndex = ModelStore.shared.selectedTipIndex
        billTextField.text = ModelStore.shared.currentBillAmount
    }
    
    //divideAmountByParty
    func divideAmountByParty() {
        let single = total/1
        let double = total/2
        let triple = total/3
        let custom = total/Double(ModelStore.shared.numberOfParty)
        
        dividedAmount1.text = "\(formatCurrency(value: single)) each"
        dividedAmount2.text = "\(formatCurrency(value: double)) each"
        dividedAmount3.text = "\(formatCurrency(value: triple)) each"
        dividedAmount4.text = "\(formatCurrency(value: custom)) each"
    }
    
    //values changed, this will link to amount input and tip percentage
    @IBAction func allowAddToRecord() {
        if total > 0 {
            addToRecord.isEnabled = true
        }
    }
    
    //save changes to user defaults
    func saveToUserDefaults(item:Any, forKey:String) {
        let recordAmounts = item //ModelStore.shared.recordAmounts //as [[Int:String]] //[Int:String]
        
        let userDefaults: UserDefaults = UserDefaults.standard
        //userDefaults.set(recordAmounts, forKey: "recordAmounts")
        userDefaults.set(recordAmounts, forKey: forKey)
        userDefaults.synchronize()
    }
    
    //format total to currency
    func formatCurrency(value: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale.current
        let result = formatter.string(from: NSDecimalNumber(decimal: Decimal(value)))
        //print(result)
        return result!
    }
}







