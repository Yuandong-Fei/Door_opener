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
    var authorizedPeople: [String] = []
    var authorizedPeopleTimes: [Int] = []
    var authorizedPeopleWeekday: [Int] = []
    var authorizedPeopleStartDate: [Int] = []
    var authorizedPeopleAllowedTimePeriod: [Int] = []
    // TODO: furthur implementing Person struct
    
    init(UID: String, name: String, gender: String, userName: String, roomReferenceNumber: String){
        self.UID = UID
        self.name = name
        self.gender = gender
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
            let gender = value["Gender"] as? String,
            let userName = value["UserName"] as? String,
            let roomReferenceNumber = value["RoomReferenceNumber"] as? String,
            let roommate = value["Roommate"] as? [String],
            let friend = value["Friend"] as? [String],
            let logDate = value["LogDate"] as? [Int],
            let logTime = value["LogTime"] as? [Int],
            let logRoomReferenceNumber = value["LogRoomReferenceNumber"] as? [String],
            let authorizedPeopleTimes = value["AuthorizedPeopleTimes"] as? [Int],
            let authorizedPeopleWeekday = value["AuthorizedPeopleWeekday"] as? [Int],
            let authorizedPeopleStartDate = value["AuthoriedPeopleStartDate"] as? [Int],
            let authorizedPeopleAllowedTimePeriod = value["AuthoriedPeopleAllowedTimePeriod"] as? [Int],
            let authorizedPeople = value["AuthorizedPeople"] as? [String] else {
                return nil
        }
        //
        //
        //
        self.ref = snapshot.ref
        self.UID = snapshot.key
        self.name = name
        self.gender = gender
        self.userName = userName
        self.roomReferenceNumber = roomReferenceNumber
        self.roommate = roommate
        self.friend = friend
        self.logDate = logDate
        self.logTime = logTime
        self.logRoomReferenceNumber = logRoomReferenceNumber
        self.authorizedPeople = authorizedPeople
        self.authorizedPeopleTimes = authorizedPeopleTimes
        self.authorizedPeopleWeekday = authorizedPeopleWeekday
        self.authorizedPeopleStartDate = authorizedPeopleStartDate
        self.authorizedPeopleAllowedTimePeriod = authorizedPeopleAllowedTimePeriod
    }
    func toAnyObject() -> Any {
        return [
            "Name": name,
            "Gender": gender,
            "UserName": userName,
            "RoomReferenceNumber": roomReferenceNumber,
            "Roommate": roommate,
            "Friend": friend,
            "AuthorizedPeople": authorizedPeople,
            "AuthorizedPeopleTimes": authorizedPeopleTimes,
            "AuthorizedPeopleWeekday": authorizedPeopleWeekday,
            "AuthorizedPeopleStartDate": authorizedPeopleStartDate,
            "AuthorizedPeopleAllowedTimePeriod": authorizedPeopleAllowedTimePeriod,
            "LogDate": logDate,
            "LogTime": logTime,
            "LogRoomReferenceNumber": logRoomReferenceNumber
        ]
    }
}
