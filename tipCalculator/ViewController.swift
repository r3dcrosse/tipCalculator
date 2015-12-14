//
//  ViewController.swift
//  tipCalculator
//
//  Created by David Wayman on 11/27/15.
//  Copyright © 2015 David Wayman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    // @IBOutlet weak var SettingsButton: UIBarButtonItem!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    // Declare user defaults
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaultTipIndex: Int = userDefaults.integerForKey("default_tip_index")
        
        // Set the default text fields/labels
        billField.text = userDefaults.stringForKey("default_billField")
        tipLabel.text = String(userDefaults.doubleForKey("default_tipLabel"))
        totalLabel.text = String(userDefaults.doubleForKey("default_totalLabel"))
        
        // Set the segmented control default
        tipControl.selectedSegmentIndex = defaultTipIndex
        
        // Recalculate the tip amount
        onEditingChange(tipControl)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display keyboard when app runs
        displayKeyboard()
    }
    
    func displayKeyboard() {
        self.billField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChange(sender: AnyObject) {
        let tipPrecentages = [0.15, 0.18, 0.2, 0.22, 0.25]
        let tipPercentage = tipPrecentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        // save state for labels/fields
        userDefaults.setObject(billField.text, forKey: "default_billField")
        userDefaults.setDouble(tip, forKey: "default_tipLabel")
        userDefaults.setDouble(total, forKey: "default_totalLabel")
        userDefaults.synchronize()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

