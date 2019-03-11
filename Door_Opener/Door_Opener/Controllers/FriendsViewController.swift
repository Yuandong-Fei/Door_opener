//
//  FriendsViewController.swift
//  Door_Opener
//
//  Created by Ziheng Yan on 2/18/19.
//  Copyright © 2019 Ziheng Yan. All rights reserved.
//

import UIKit
import Firebase

class FriendsViewController: UITableViewController {
    let user = Auth.auth().currentUser!
    let ref = Database.database().reference(withPath: "Person")
    let userRef = Database.database().reference(withPath: "User")
    //var friends = SampleData.generatePersonData()
    var friends: [Person] = []
    
    //
    // TODO: check the purpose of the following overriding function
    //
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelectionDuringEditing = false
        // Do any additional setup after loading the view.
        //user = User(uid: "FakeId", email: "test@person.food")
//        print(user.uid)
        let currentRef = Database.database().reference(withPath: "User/\(user.uid)")
//        print("User/\(user.uid)")
        currentRef.observe(.value, with: { snapshot in
//            print(snapshot.value as Any)
            var newFriends: [Person] = []
            for child in snapshot.children {
                
                if let snapshot = child as? DataSnapshot,
                    let friend = Person(snapshot: snapshot) {
                    print(snapshot.value as Any)
                    print("..................")
                    newFriends.append(friend)
                }
            }
            self.friends = newFriends
            self.tableView.reloadData()
        })
//        Auth.auth().addStateDidChangeListener { auth, user in
//            guard let user = user else { return }
//            //self.user = User(authData: user)
//        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        print("entered friendcell call")
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.userName
        cell.detailTextLabel?.text = friend.email
        
        //
        // TODO: change the following statement so that authorization status can be changed
        //
        //toggleCellCheckbox(cell, true: friend.authorizedPeople)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friends.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    @IBAction func cancelToFriendsViewController(_ segue: UIStoryboardSegue) {}
    @IBAction func saveFriendDetail(_ segue: UIStoryboardSegue) {}
    @IBAction func addButtonDidTouch(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Add a Friend",
                                      message: "Please enter a username",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textField = alert.textFields?.first,
                let userNameEntered = textField.text else { return }
            self.ref.observe(.value, with: { snapshot in
                if snapshot.childSnapshot(forPath: userNameEntered).exists(){
                    //
                    // TODO: append friend added to personal account
                    //
                    
                    let friend = Person(name: "NameTest", email: "email", userName: userNameEntered, roomReferenceNumber: "Room")
                    let currentUserRef = Database.database().reference(withPath: "User/\(self.user.uid)").child(userNameEntered.lowercased())
                    currentUserRef.setValue(friend.toAnyObject())
                    self.friends.append(friend)
                    self.tableView.reloadData()
                    
                }
                else {
                    let userNameErrorAlert = UIAlertController(title: "Error",
                                                               message: "Username does not exist",
                                                               preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "Cancel", style: .cancel)
                    userNameErrorAlert.addAction(alertAction)
                    self.present(userNameErrorAlert, animated: true, completion: nil)
                }
            })
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
