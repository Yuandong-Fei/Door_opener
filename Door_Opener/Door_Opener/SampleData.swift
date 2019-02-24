//
//  SampleData.swift
//  Door_Opener
//
//  Created by 晏子恒 on 2/18/19.
//  Copyright © 2019 晏子恒. All rights reserved.
//

import Foundation

final class SampleData {
    
    static func generatePersonData() -> [Person] {
        return [
            Person(UID: "UID1", name: "NAME1", gender: "Male", userName: "UserName1", roomReferenceNumber: "CATA5230"),
            
            Person(UID: "UID@", name: "NAME2", gender: "Female", userName: "UserName2", roomReferenceNumber: "CATA8211")
        ]
    }
}
