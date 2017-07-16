//
//  TestViewController.swift
//  Tips Calculater
//
//  Created by User on 7/7/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


class CustomClass: NSObject, NSCoding {
    
    var name = ""
    var isActive = false
    
    init(name: String, isActive: Bool) {
        self.name = name
        self.isActive = isActive
    }
    
    // MARK: NSCoding
    
    required convenience init?(coder decoder: NSCoder) {
        guard let name = decoder.decodeObject(forKey: "name") as? String,
            let isActive = decoder.decodeObject(forKey: "isActive") as? Bool
            else { return nil }
        
        self.init(name: name, isActive: isActive)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "name")
        coder.encode(self.isActive, forKey: "isActive")
    }
}

