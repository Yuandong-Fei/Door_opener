//
//  User.swift
//  Door_Opener
//
//  Created by 晏子恒 on 2/17/19.
//  Copyright © 2019 晏子恒. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uid: String
    let email: String
    
    init(authData: Firebase.User) {
        uid = authData.uid
        email = authData.email!
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
