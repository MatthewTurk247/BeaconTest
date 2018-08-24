//
//  LoginViewController.swift
//  BeaconTest
//
//  Created by Matthew Turk on 9/12/15.
//  Copyright (c) 2015 Humanity. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBAction func loginAction(sender: AnyObject) {
        
        var email = emailTF.text
        var password = passwordTF.text
        NSUserDefaults.standardUserDefaults().setValue(email, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setValue(password, forKey: "userPassword")
        
        email = email.lowercaseString
        PFUser.logInWithUsernameInBackground(email, password: password) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                
                // Login user.
                self.performSegueWithIdentifier("loginSegue", sender: self)
            } else {
                
                // The login failed. Check error to see why.
                var alert = UIAlertView(title: "Error", message: error?.description, delegate: self, cancelButtonTitle: "Ok")
                alert.show()
            }
        }
    }
    
    @IBAction func cancelAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {});
    }

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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
