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
            Person(UID: "UID1",name: "Billy",gender: "Male",userName: "Billy2000",roomReferenceNumber: "CATA5230", authorizedPeople: AuthorizedPeople(UID: "UID1", authorized: true, times: 5, weekday: 3, startTime: 930, endTime: 1530)),
            
            Person(UID: "UID2",name: "name2",gender: "Female",userName: "username2",roomReferenceNumber: "room2", authorizedPeople: AuthorizedPeople(UID: "UID2", authorized: false, times: 0, weekday: 0, startTime: 0, endTime: 0))
        ]
    }
}
