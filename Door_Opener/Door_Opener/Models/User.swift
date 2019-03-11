//
//  User.swift
//  Door_Opener
//
//  Created by Ziheng Yan on 2/17/19.
//  Copyright © 2019 Ziheng Yan. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uid: String
    let email: String
    var userName: String = "defaulUserName"
    var roomReferenceNumber: String = "defaultRoom"
    
    init(authData: Firebase.User) {
        uid = authData.uid
        email = authData.email!
    }
    
    init(uid: String, email: String, userName: String, roomReferenceNumber: String) {
        self.uid = uid
        self.email = email
        self.userName = userName
        self.roomReferenceNumber = roomReferenceNumber
    }
    
    func toAnyObject() -> Any {
        return [
            "uid": uid,
            "email": email,
            "username": userName,
            "roomReferenceNumber": roomReferenceNumber
        ]
    }
}
