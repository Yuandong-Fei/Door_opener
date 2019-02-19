//
//  AuthorizedPeople.swift
//  Door_Opener
//
//  Created by 晏子恒 on 2/17/19.
//  Copyright © 2019 晏子恒. All rights reserved.
//

import Foundation
import Firebase
struct AuthorizedPeople {
    //let UID: String
    
    // TODO: Considering whether or not to include UID in the struct
    // TODO: Considersing acting as an attribute of each person
    //
    var authorized: Bool
    var times: Int
    var weekday: Int
    var startTime: Int
    var endTime: Int
    
    init(UID: String, authorized: Bool, times: Int, weekday: Int, startTime: Int, endTime: Int){
        //self.UID = UID
        
        // TODO: initializing UID
        //
        //
        self.authorized = authorized
        self.times = times
        self.weekday = weekday
        self.startTime = startTime
        self.endTime = endTime
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            // TODO: gain reference from Firebase datasnapshot
            //
            //
            let value = snapshot.value as? [String: AnyObject],
            let authorized = value["authorized"] as? Bool,
            let times = value["times"] as? Int,
            let weekday = value["weekday"] as? Int,
            let startTime = value["startTime"] as? Int,
            let endTime = value["endTime"] as? Int else {
                return nil
        }
        // TODO: initialize UID
        //
        //
        self.authorized = authorized
        self.times = times
        self.weekday = weekday
        self.startTime = startTime
        self.endTime = endTime
    }
}
