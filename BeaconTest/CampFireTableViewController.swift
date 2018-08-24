//
//  CampFireTableViewController.swift
//  BeaconTest
//
//  Created by Matthew Turk on 9/12/15.
//  Copyright (c) 2015 Humanity. All rights reserved.
//

import UIKit
import Parse

class CampFireTableViewController: UITableViewController {
    let arr:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        var query = PFQuery(className:"Room")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) rooms.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        print(object.objectForKey("name"))
                        var it:AnyObject = object.objectForKey("name")!

                        self.arr.addObject(it)
                    }
                    
                    self.tableView!.reloadData()
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return arr.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.view.frame.width;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! CampFireTableViewCell

        cell.campFireCellText.text = arr[indexPath.row] as? String
        
        cell.campFireCellImage.image = UIImage(named: (arr[indexPath.row] as? String)!)
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
