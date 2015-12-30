//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by David Wayman on 11/27/15.
//  Copyright © 2015 David Wayman. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var customPercentTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    // Declare default floats as global variables
    var lowestTip: Float!
    var midTip: Float!
    var highestTip: Float!
    var defaultTipIndex: Int!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customPercentLabel = userDefaults.objectForKey("custom_tipLabel")
        
        // Set the segmented control default
        defaultTipIndex = userDefaults.integerForKey("default_tip_index")
        defaultTipControl.selectedSegmentIndex = defaultTipIndex
        defaultTipControl.setTitle(String(customPercentLabel!), forSegmentAtIndex: 4)
        
        displayKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segControlTapped(sender: AnyObject) {
        // Reset the default tip setting whenever the button is changed
        userDefaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "default_tip_index")
        userDefaults.synchronize()
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        // do that optional chaining stuff to unwrap textfield optional
        if let customPercent = Double(customPercentTextField.text!) {
            defaultTipControl.setTitle("\(customPercent)%", forSegmentAtIndex: 4)
            
            let actualPercentValue: Double = customPercent/100
            userDefaults.setDouble(actualPercentValue, forKey: "custom_tipPercent")
            userDefaults.setObject("\(customPercent)%", forKey: "custom_tipLabel")
            userDefaults.synchronize()
        } else {
            defaultTipControl.setTitle("0%", forSegmentAtIndex: 4) // Sets default to 0% if value is nil
            
            let actualPercentValue: Double = 0/100
            userDefaults.setDouble(actualPercentValue, forKey: "custom_tipPercent")
            userDefaults.setObject("0%", forKey: "custom_tipLabel")
            userDefaults.synchronize()
        }
        
        // Clear text field
        customPercentTextField.text = ""
    }
    
    func displayKeyboard() {
        self.customPercentTextField.becomeFirstResponder()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}
