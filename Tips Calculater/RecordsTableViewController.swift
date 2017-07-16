//
//  RecordsTableViewController.swift
//  Tips Calculater
//
//  Created by User on 7/4/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class RecordsTableViewController: UITableViewController {
    @IBOutlet var deleteView: UIView!
    @IBOutlet var deleteLabel: UILabel!
    @IBOutlet var deleteYes: UIButton!
    @IBOutlet var deleteNo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make sure the delete view is hidden
        deleteView.frame.size.height = 0
        deleteLabel.isHidden = true
        deleteYes.isHidden = true
        deleteNo.isHidden = true
    }

    @IBAction func deleteRecords(_ sender: AnyObject) {
        
        let pressed = sender.currentTitle!
        
        deleteView.frame.size.height = 0
        deleteLabel.isHidden = true
        deleteYes.isHidden = true
        deleteNo.isHidden = true
        
        if pressed == "Yes" {
            let userDefaults: UserDefaults = UserDefaults.standard
            userDefaults.removeObject(forKey: "recordAmounts")
            ModelStore.shared.recordAmounts = []
            self.tableView.reloadData()
        }
    }
    
    @IBAction func trashCan() {
        deleteView.frame.size.height = 60 // = CGRect(x:0, y:0, width: )
        deleteLabel.isHidden = false
        deleteYes.isHidden = false
        deleteNo.isHidden = false
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ModelStore.shared.recordAmounts.count
    }

    ///*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! RecordTableViewCell

        //let record = ModelStore.shared.records[indexPath.row]
        let recordAmounts = ModelStore.shared.recordAmounts
        //let recordDates = ModelStore.shared.recordDates
        
        cell.date.text = recordAmounts[indexPath.row]["date"] as? String //recordDates[indexPath.row]
        
        cell.amount1.text = recordAmounts[indexPath.row]["1"] as? String
        cell.amount2.text = recordAmounts[indexPath.row]["2"] as? String
        cell.amount3.text = recordAmounts[indexPath.row]["3"] as? String
        cell.amount4.text = recordAmounts[indexPath.row]["customPartAmount"] as? String
        cell.customPartySize.text = "😎 x \(recordAmounts[indexPath.row]["customPartySize"]!)"
        cell.tipPrecentage.text = recordAmounts[indexPath.row]["tipPercentages"] as? String
        cell.totalAmount.text = recordAmounts[indexPath.row]["totalAmount"] as? String

        return cell
    }
    //*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
