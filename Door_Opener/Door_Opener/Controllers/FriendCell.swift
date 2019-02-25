//
//  FriendCell.swift
//  Door_Opener
//
//  Created by 晏子恒 on 2/18/19.
//  Copyright © 2019 晏子恒. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fireImageView: UIImageView!
    
    var person: Person? {
        didSet {
            guard let person = person else { return }
        
            nameLabel.text = person.name
            userNameLabel.text = person.userName
//            fireImageView.image = image(forFrequency: person.authorizedPeopleTimes[0])
            // TODO change the following statements, just for testing
            fireImageView.image = UIImage(named: "fire")
        }
    }
    //
    // TODO: modify function to get specific times one enters the door
    // TODO: day2 = 2* day1 if entered, plus 1 binary number
    //
    func image(forFrequency frequency: Int) -> UIImage? {
        let imageName = "fire.png"
        return UIImage(named: imageName)
    }
}
