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
    
    // Declare default floats as global variables
    var lowestTip: Float!
    var midTip: Float!
    var highestTip: Float!
    var defaultTipIndex: Int!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //lowestTip = userDefaults.floatForKey("lowest_tip")
        //midTip = userDefaults.floatForKey("mid_tip")
        //highestTip = userDefaults.floatForKey("highest_tip")
        defaultTipIndex = userDefaults.integerForKey("default_tip_index")
        
        // Set the segmented control default
        defaultTipControl.selectedSegmentIndex = defaultTipIndex
        
        //defaultTipControl.setTitle("\(lowestTip)", forSegmentAtIndex: 0)
        //defaultTipControl.setTitle("\(midTip)", forSegmentAtIndex: 1)
        //defaultTipControl.setTitle("\(highestTip)", forSegmentAtIndex: 2)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
