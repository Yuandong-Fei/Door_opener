# Door_opener

## Week 6
1. Updated firebase
2. Updated Door and board schematics
3. ordered parts
4. Bluetooth back up

## Week 7
1. Printed the schematics and modify it
2. Back end updated
3. data structure completed
4. Succesfully connected database to Arduino
5. circuit schematics updated
6. Servo and LCD tested
7. App created and logic gateway is updated

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
