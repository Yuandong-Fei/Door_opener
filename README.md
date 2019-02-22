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
            "Name": "Steven",
            "Gender": "Male",
            "UserName": "xkcd",
            "RoomReferenceNumber": "CATA5230",
            "Roommate": "UID": ["j8iONssTdMJyzjv2vi53IeYfk1U5", "NssTdMJyzjv2vi53IeYfk1U5j8iO"],
            "Friend": ["TdMJyzjv2vi53IeYfk1U5j8iONss","j8iONssTdMJyzjv2vi53IeYfk1U5", "NssTdMJyzjv2vi53IeYfk1U5j8iO"],
            "AuthourizedPeople": ["TdMJyzjv2vi53IeYfk1U5j8iONss"],
            "logsDate": ["0612", "0530"],
            "logsTime": ["0612", "0530"],
            "logsRoom": ["CATA5230", "CATA8211"]["0612", "0530"]
        }
    }
    "Door": {
        "CATA5230": {
            "RoomOwner": "vi53IeYfk1U5j8iONssTdMJyzjv2",
            "Status": False, //False for Locked doors
            "FaceIDAuthorized": False,
            "Message": "Waiting Authorization",
            "logUserName": ["NssTdMJyzjv2vi53IeYfk1U5j8iO"],
            "logDate": [],
            "logTime": []
        }
    }
}
```
