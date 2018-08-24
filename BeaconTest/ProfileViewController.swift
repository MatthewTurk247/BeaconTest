//
//  ProfileViewController.swift
//  BeaconTest
//
//  Created by Matthew Turk on 9/13/15.
//  Copyright (c) 2015 Humanity. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBAction func profileDoneAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet var userEmailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        userEmailLabel.text = "Hello, " + String(stringInterpolationSegment: NSUserDefaults.standardUserDefaults().valueForKey("userEmail")!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
