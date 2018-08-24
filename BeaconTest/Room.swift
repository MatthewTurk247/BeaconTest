//
//  Room.swift
//  BeaconTest
//
//  Created by Matthew Turk on 9/12/15.
//  Copyright (c) 2015 Humanity. All rights reserved.
//

import UIKit
import Parse

class Room: NSObject {
    var title: String
    var desc: String
    var image: UIImage
    var status:String
    var users:String
    var beaconID:String
    
    init(titled: String, desc: String, image: UIImage, status: String, users: String, beaconID: String) {
        self.title = titled
        self.desc = desc
        self.image = image
        self.status = status
        self.users = users
        self.beaconID = beaconID
    }
}
