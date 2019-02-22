//
//  Person.swift
//  Door_Opener
//
//  Created by 晏子恒 on 2/17/19.
//  Copyright © 2019 晏子恒. All rights reserved.
//

import Foundation
import Firebase

struct Person {
    let ref: DatabaseReference?
    let UID: String
    let name: String
    let gender: String
    let userName: String
    var roomReferenceNumber: String
    var roommate: [String] = []
    var friend: [String] = []
    var logDate: [Int] = []
    var logTime: [Int] = []
    var logRoomReferenceNumber: [String] = []
    var authorizedPeople: AuthorizedPeople
    // var authorizedBy: String
    // TODO: furthur implementing Person struct
    
    init(UID: String, name: String, gender: String, userName: String, roomReferenceNumber: String, authorizedPeople: AuthorizedPeople){
        self.UID = UID
        self.name = name
        self.gender = gender
        self.userName = userName
        self.roomReferenceNumber = roomReferenceNumber
        self.authorizedPeople = authorizedPeople
        self.ref = nil
    }
    // TODO1: implement init? from database
    // TODO2: implement toAnyObject()
    //
    
    init?(snapshot: DataSnapshot) {
        guard
            // TODO: gain reference from Firebase datasnapshot
            //
            //
            let value = snapshot.value as? [String: AnyObject],
            let UID = value["UID"] as? String,
            let name = value["name"] as? String,
            let gender = value["gender"] as? String,
            let userName = value["userName"] as? String,
            let roomReferenceNumber = value["roomReferenceNumber"] as? String,
            let authorizedPeople = value["authorizedPeople"] as? AuthorizedPeople else {
                return nil
        }
        // TODO: initialize UID
        //
        //
//        self.authorized = authorized
//        self.times = times
//        self.weekday = weekday
//        self.startTime = startTime
//        self.endTime = endTime
    }
}
