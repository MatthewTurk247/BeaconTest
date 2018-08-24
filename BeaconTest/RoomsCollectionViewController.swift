//
//  RoomsCollectionViewController.swift
//  BeaconTest
//
//  Created by Matthew Turk on 9/12/15.
//  Copyright (c) 2015 Humanity. All rights reserved.
//

import UIKit
import Parse

let reuseIdentifier = "Cell"

class RoomsCollectionViewController: UICollectionViewController {

    let rooms:NSMutableArray = NSMutableArray()
    var indexForSegue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Search for Rooms and pull from Parse.
        var query = PFQuery(className:"Room")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) rooms.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        
                        self.rooms.addObject(object)
                    }
                    
                    self.collectionView!.reloadData()
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "ShowInfo":
                
                let roomDetailVC = segue.destinationViewController as! RoomsDetailViewController
                roomDetailVC.room = self.rooms[self.indexForSegue] as! PFObject
                
            default: break
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.indexForSegue = indexPath.row
        self.performSegueWithIdentifier("ShowInfo", sender: indexPath)
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.rooms.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) 
        print(self.rooms.objectAtIndex(indexPath.row).objectForKey("image") as AnyObject!)
        
        //var image: UIImage = UIImage(named: (rooms[indexPath.row].objectForKey("name") as? String)!)!
        
        //var imageView = UIImageView(image: image)
        
        if let imageView = self.rooms[indexPath.row].valueForKey("image")! as? PFFile {
            imageView.getDataInBackgroundWithBlock({ (imageData:NSData?, error:NSError?) -> Void in
                if (error == nil) {
                    let image = UIImage(data: imageData!)
                    
                    
                    let imageViewForCell = UIImageView(image: image)
                    var frame = CGRect()
                    frame.size.height = cell.frame.height
                    frame.size.width = cell.frame.width
                    imageViewForCell.frame = frame
                    cell.addSubview(imageViewForCell)
                }
            })
        }
        
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var length = self.collectionView?.frame.width
        length = length! / 3
        length = length! - 1
        
        return CGSizeMake(length!, length!)
    }
}
