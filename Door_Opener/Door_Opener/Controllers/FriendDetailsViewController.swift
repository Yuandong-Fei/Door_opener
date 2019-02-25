//
//  FriendDetailsViewController.swift
//  Door_Opener
//
//  Created by 晏子恒 on 2/23/19.
//  Copyright © 2019 晏子恒. All rights reserved.
//

import UIKit
import Firebase

class FriendDetailsViewController: UITableViewController {
    var friend: Person?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension FriendDetailsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
}
