# Door_opener

## Week 6
1. Updated firebase
2. Updated Door and board schematics
3. ordered parts
4. Bluetooth back up

## Backend data structure
```javascript
// The root of the tree
{
    "Person": {
        "vi53IeYfk1U5j8iONssTdMJyzjv2": {
            "Profile": {
                "Name": "Steven",
                "Gender": "Male",
                "UserName": "xkcd",
                "RoomReferenceNumber": "CATA5230"
            },
            "Roommate": {
                "UID": ["j8iONssTdMJyzjv2vi53IeYfk1U5", "NssTdMJyzjv2vi53IeYfk1U5j8iO"]
            },
            "Friend": {
                "UID": ["TdMJyzjv2vi53IeYfk1U5j8iONss","j8iONssTdMJyzjv2vi53IeYfk1U5", "NssTdMJyzjv2vi53IeYfk1U5j8iO"]
            },
            "AuthourizedPeople": {
                "TdMJyzjv2vi53IeYfk1U5j8iONss": {
                    "Times": 1,
                    "TimePeriod": [1030, 2045]
                }
            }
        }
    }
    "Door": {
        "CATA5230": {
            "RoomOwner": "vi53IeYfk1U5j8iONssTdMJyzjv2",
            "Status": False, //False for Locked doors
            "FaceIDAuthorized": False,
            "Message": "Waiting Authorization",
            "Log": {
                "NssTdMJyzjv2vi53IeYfk1U5j8iO": {
                    "NumberOfEntries": 1,
                    "1": {
                        "Year": 2019,
                        "Month": 02,
                        "Day": 17,
                        "Hour": 09,
                        "Minute": 24
                    }
                }
            }
        }
    }
}
```
