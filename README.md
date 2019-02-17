# Door_opener

Week 6
1. Updated firebase
2. Updated Door and board schematics
3. ordered parts
4. Bluetooth back up

# Backend data structure
```javascript
// The root of the tree
{
    "Users": {
        "George": {
            "Friends": {
                "Alice": {
                    "user_name": "Alice2000",
                    "log": ["1902131602","1902160930"] //using an ordered linked list, YYMMDDHHMM
                }
                "Jim": {
                "user_name": "jimmmmm",
                "log": ["19021301359"] //using an ordered linked list, YYMMDDHHMM
                }
            }
            "Door": {
                "Status": True,
                "Being_authorized": True,
                "User": "Jim",
                "Message": "Door Unlocked"
            }
        }
    }
}
```
