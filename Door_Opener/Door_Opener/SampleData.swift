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
            Person(name: "NAME1", email: "testemail1", userName: "UserName1", roomReferenceNumber: "CATA5230"),
            
            Person(name: "NAME2", email: "testemail2", userName: "UserName2", roomReferenceNumber: "CATA8211")
        ]
    }
}
