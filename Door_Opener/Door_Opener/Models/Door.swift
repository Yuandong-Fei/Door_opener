//
//  Door.swift
//  Door_Opener
//
//  Created by Ziheng Yan on 2/23/19.
//  Copyright © 2019 Ziheng Yan. All rights reserved.
//

import Foundation
import Firebase

struct Door{
    let ref: DatabaseReference?
    let roomReferenceNumber: String
    var roomOwner: [String] = []
    var doorStatus: Bool
    var authorizationStatus: Bool
    var message: String
    var logUID: [String] = []
    var logDate: [Int] = []
    var logTime: [Int] = []
    
    init(roomReferenceNumber: String, roomOwner: [String], doorStatus: Bool, authorizationStatus: Bool, message: String, logUID: [String], logDate: [Int], logTime: [Int]){
        self.ref = nil
        self.roomReferenceNumber = roomReferenceNumber
        self.roomOwner = roomOwner
        self.doorStatus = doorStatus
        self.authorizationStatus = authorizationStatus
        self.message = message
        self.logUID = logUID
        self.logDate = logDate
        self.logTime = logTime
    }
    
    init?(snapshot: DataSnapshot){
        guard
            let value = snapshot.value as? [String: AnyObject],
            let roomOwner = value["RoomOwner"] as? [String],
            let doorStatus = value["DoorStatus"] as? Bool,
            let authorizationStatus = value["AuthorizationStatus"] as? Bool,
            let message = value["Message"] as? String,
            let logUID = value["LogUID"] as? [String],
            let logDate = value["LogDate"] as? [Int],
            let logTime = value["LogTime"] as? [Int] else {
                return nil
        }
        self.ref = snapshot.ref
        self.roomReferenceNumber = snapshot.key
        self.roomOwner = roomOwner
        self.doorStatus = doorStatus
        self.authorizationStatus = authorizationStatus
        self.message = message
        self.logUID = logUID
        self.logTime = logTime
        self.logDate = logDate
    }
    
    func toAnyObject() -> Any {
        return [
            "RoomOwner": roomOwner,
            "DoorStatus": doorStatus,
            "AuthorizationStatus": authorizationStatus,
            "Message": message,
            "LogUID": logUID,
            "LogDate": logDate,
            "LogTime": logTime
        ]
    }
}
