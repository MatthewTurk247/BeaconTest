//
//  SignUpViewController.swift
//  BeaconTest
//
//  Created by Matthew Turk on 9/12/15.
//  Copyright (c) 2015 Humanity. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var fullnameTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBAction func signUpAction(sender: AnyObject) {
        
        
        var name = fullnameTF.text
        var email = emailTF.text
        var password = passwordTF.text
        
        // Ensure user doesn't enter in any blank fields.
        // Attempt sign up.
        if (name == nil ||
            email == nil ||
            password == nil) {
                
                var alert = UIAlertView(title: "Error", message: "Fields cannot be blank.", delegate: self, cancelButtonTitle: "Ok")
                alert.show()
        }
        else {
            
            // Lowercase strings for easier login later.
            name = name.lowercaseString
            email = email.lowercaseString
            
            let user = PFUser()
            user.username = email
            user.password = password
            user.email = email
            user.setObject(name, forKey: "name")
            user.signUpInBackgroundWithBlock { (var success:Bool, var error:NSError?) -> Void in
                
                if error == nil {
                    
                    print("success")
                    self.dismissViewControllerAnimated(true, completion: {});
                } else {
                    
                    var alert = UIAlertView(title: "Error", message: error?.description, delegate: self, cancelButtonTitle: "Ok")
                    alert.show()
                }
            }
        }
    }
    
    @IBAction func cancelAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {});
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fullnameTF.delegate = self
        fullnameTF.becomeFirstResponder()
        emailTF.delegate = self
        passwordTF.delegate = self
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
