//
//  FriendsViewController.swift
//  Door_Opener
//
//  Created by 晏子恒 on 2/18/19.
//  Copyright © 2019 晏子恒. All rights reserved.
//

import UIKit
import Firebase

class FriendsViewController: UITableViewController {
    
    let ref = Database.database().reference(withPath: "Person")
    
    //var friends = SampleData.generatePersonData()
    var friends: [Person] = []
    var user: Person!
    //
    // TODO: check the purpose of the following overriding function
    //
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        user = Person(UID: "UID1", name: "NAME1", gender: "Male", userName: "UserName1", roomReferenceNumber: "CATA5230")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FriendsViewController {
    
    @IBAction func cancelToFriendsViewController(_ segue: UIStoryboardSegue) {}
    @IBAction func saveFriendDetail(_ segue: UIStoryboardSegue) {}
    @IBAction func addButtonDidTouch(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Friend",
                                      message: "Add a Friend",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            let textField = alert.textFields![0]
            
            let friend = Person(UID: "UIDTest", name: "NameTest", gender: "Male", userName: textField.text!, roomReferenceNumber: "Room")
            
            self.friends.append(friend)
            self.tableView.reloadData()
        
        }
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        present(alert, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
        
        let friend = friends[indexPath.row]
        cell.person = friend
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
}
