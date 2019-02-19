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
}
