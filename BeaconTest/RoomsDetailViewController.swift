//
//  RoomsDetailViewController.swift
//  BeaconTest
//
//  Created by Matthew Turk on 9/12/15.
//  Copyright (c) 2015 Humanity. All rights reserved.
//

import UIKit
import Parse

class RoomsDetailViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var userTableView: UITableView!
    @IBOutlet var roomInfoLabel: UILabel!
    @IBOutlet var roomTitleLabel: UILabel!
    @IBOutlet var roomImageView: UIImageView!
    var room:PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userTableView.delegate = self
        if (room != nil) {
            
            if let imageView = self.room.valueForKey("image")! as? PFFile {
                imageView.getDataInBackgroundWithBlock({ (imageData:NSData?, error:NSError?) -> Void in
                    if (error == nil) {
                        let image = UIImage(data: imageData!)
                        
                        
                        self.roomImageView.image = image
                    }
                })
            }
            
            roomTitleLabel.text = room.objectForKey("name")! as! String
            roomInfoLabel.text = room.objectForKey("info")! as! String
        }
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
