//
//  ViewController.swift
//  tipCalculator
//
//  Created by David Wayman on 11/27/15.
//  Copyright © 2015 David Wayman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billLabelName: UILabel!
    @IBOutlet weak var tipLabelName: UILabel!
    @IBOutlet weak var blackBar: UIView!
    @IBOutlet weak var totalLabelName: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
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
        
        let customTipLabel = userDefaults.objectForKey("custom_tipLabel")
        tipControl.setTitle(String(customTipLabel!), forSegmentAtIndex: 4)
        
        displayKeyboard()
        
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
        let customTipPercent: Double = userDefaults.doubleForKey("custom_tipPercent")
        
        let tipPrecentages = [0.15, 0.18, 0.2, 0.22, customTipPercent]
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
        
        // animations if there is nothing in billAmount field
        if NSString(string: billField.text!) == "" {
            totalLabel.alpha = 0;
            totalLabelName.alpha = 0;
            
            blackBar.alpha = 0;
            
            tipLabel.alpha = 0;
            tipLabelName.alpha = 0;
            
            billLabelName.text = "Enter your bill amount:"
            
            tipControl.alpha = 0;
        } else {
            
            // Do some cool animations like have labels fade in
            UIView.animateWithDuration(1, animations: {
                    self.totalLabel.alpha = 1
                    self.totalLabelName.alpha = 1
                
                    self.blackBar.alpha = 1
                
                    self.tipLabel.alpha = 1
                    self.tipLabelName.alpha = 1
                
                    self.tipControl.alpha = 1
                })
            
            billLabelName.text = "Bill Amount:"
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

