//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by David Wayman on 11/27/15.
//  Copyright © 2015 David Wayman. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defualtTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveDefaultPercentage(sender: AnyObject) {
        
        let defualtTipPrecentages = [0.15, 0.18, 0.2, 0.22, 0.25]
        let defaultTipPercentage = defualtTipPrecentages[defualtTipControl.selectedSegmentIndex]
        
        // NOT WORKING YET::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("some_string_to_save", forKey: "some_key_that_you_choose")
        defaults.setInteger(123, forKey: "another_key_that_you_choose")
        defaults.synchronize()
        // :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
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
