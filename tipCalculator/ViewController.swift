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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        // :: NOT WORKING ::
        // check to see if defaults have been set already, if not, create new default and set it
        /*if (defaults.integerForKey("default_tip_setting") == nil) {
            defaults.setInteger(2, forKey: "default_tip_setting")
            defaults.synchronize()
        } else {
            let intValue = defaults.integerForKey("default_tip_setting")
            tipControl.selectedSegmentIndex = intValue
        }*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // test comment
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
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

