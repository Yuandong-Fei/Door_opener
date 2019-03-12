//
//  Person.swift
//  Door_Opener
//
//  Created by Ziheng Yan on 2/17/19.
//  Copyright © 2019 Ziheng Yan. All rights reserved.
//

import Foundation
import Firebase

struct Person {
    let ref: DatabaseReference?
//    let UID: String
    var name: String = "defaultName"
    var email: String = "defaultEmail"
//    let gender: String
    var userName: String = "defaultUserName"
    var roomReferenceNumber: String = "defaultRoomReferenceNumber"
    var roommate: [String] = ["defaultRoomMate1", "defaultRoomMate2"]
    var friend: [String] = []
//    var logDate: [Int] = []
//    var logTime: [Int] = []
//    var logRoomReferenceNumber: [String] = []
    var authorizedPeople: [String] = []
//    var authorizedPeopleTimes: [Int] = []
//    var authorizedPeopleWeekday: [Int] = []
//    var authorizedPeopleStartDate: [Int] = []
//    var authorizedPeopleAllowedTimePeriod: [Int] = []
    // TODO: furthur implementing Person struct
    
    init(name: String, email: String, userName: String, roomReferenceNumber: String){
//        self.UID = UID
        self.name = name
        self.email = email
        self.userName = userName
        self.roomReferenceNumber = roomReferenceNumber
        self.ref = nil
    }
    //
    // TODO2: implement toAnyObject()
    //
    
    init?(snapshot: DataSnapshot) {
        guard
            // TODO: gain reference from Firebase datasnapshot
            //
            //
            let value = snapshot.value as? [String: AnyObject],
            let name = value["Name"] as? String,
//            let email = value["email"] as? String,
//            let gender = value["Gender"] as? String,
            let userName = value["UserName"] as? String,
            let email = value["Email"] as? String,
            let roomReferenceNumber = value["RoomReferenceNumber"] as? String
//            let roommate = value["Roommate"] as? [String]
//            let friend = value["Friend"] as? [String],
//            let logDate = value["LogDate"] as? [Int],
//            let logTime = value["LogTime"] as? [Int],
//            let logRoomReferenceNumber = value["LogRoomReferenceNumber"] as? [String],
//            let authorizedPeopleTimes = value["AuthorizedPeopleTimes"] as? [Int],
//            let authorizedPeopleWeekday = value["AuthorizedPeopleWeekday"] as? [Int],
//            let authorizedPeopleStartDate = value["AuthoriedPeopleStartDate"] as? [Int],
//            let authorizedPeopleAllowedTimePeriod = value["AuthoriedPeopleAllowedTimePeriod"] as? [Int],
            
//            let authorizedPeople = value["AuthorizedPeople"] as? [String]
        else {
            print("!!!!!!!!!!!!!!!")
                return nil
            
        }
        //
        //
        //
        print("Successfully")
        self.ref = snapshot.ref
//        self.name = snapshot.key
//        self.UID = snapshot.key
        self.name = name
        self.email = email
        self.userName = userName
        self.roomReferenceNumber = roomReferenceNumber
//        self.roommate = roommate
//        self.friend = friend
//        self.logDate = logDate
//        self.logTime = logTime
//        self.logRoomReferenceNumber = logRoomReferenceNumber
//        self.authorizedPeople = authorizedPeople
//        self.authorizedPeopleTimes = authorizedPeopleTimes
//        self.authorizedPeopleWeekday = authorizedPeopleWeekday
//        self.authorizedPeopleStartDate = authorizedPeopleStartDate
//        self.authorizedPeopleAllowedTimePeriod = authorizedPeopleAllowedTimePeriod
    }
    func toAnyObject() -> Any {
        return [
            "Name": name,
//            "Gender": gender,
            "Email": email,
            "UserName": userName,
            "RoomReferenceNumber": roomReferenceNumber
//            "Roommate": roommate,
//            "Friend": friend,
//            "AuthorizedPeople": authorizedPeople,
//            "AuthorizedPeopleTimes": authorizedPeopleTimes,
//            "AuthorizedPeopleWeekday": authorizedPeopleWeekday,
//            "AuthorizedPeopleStartDate": authorizedPeopleStartDate,
//            "AuthorizedPeopleAllowedTimePeriod": authorizedPeopleAllowedTimePeriod,
//            "LogDate": logDate,
//            "LogTime": logTime,
//            "LogRoomReferenceNumber": logRoomReferenceNumber
        ]
    }
}

