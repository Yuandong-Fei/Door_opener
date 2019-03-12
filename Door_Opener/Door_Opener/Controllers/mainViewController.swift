//
//  mainViewController.swift
//  Door_Opener
//
//  Created by Ziheng Yan on 3/9/19.
//  Copyright © 2019 Ziheng Yan. All rights reserved.
//

import UIKit
import LocalAuthentication
import Firebase

enum BiometricType {
    case none
    case touchID
    case faceID
}

class mainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var roomPicker: UIPickerView!
    @IBOutlet weak var faceIDButton: UIButton!
    @IBOutlet weak var bioMetricsLabel: UILabel!
    
    var roomPickerData: [String] = [String]()
    var roomPicked: String = "N/A"
    let userRef = Database.database().reference(withPath: "Profile")
    let ref = Database.database().reference(withPath: "Message")
    let user = Auth.auth().currentUser!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roomPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roomPickerData[row]
    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        // This method is triggered whenever the user makes a change to the picker selection.
//        // The parameter named row and component represents what was selected.
//        roomPicked = roomPickerData[row]
////        print(roomPicked)
//    }
    func biometricType() -> BiometricType {
        let context: LAContext = LAContext()
        let _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        switch context.biometryType {
        case .none:
            return .none
        case .touchID:
            return .touchID
        case .faceID:
            return .faceID
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        roomPicked = roomPickerData[row]
        let myTitle = NSAttributedString(string: roomPicked, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return myTitle
    }
//
//    func userProfileNotSet() -> Bool{
//        var flag: Bool = false
//        self.userRef.observe(.value, with: {snapshot in
//            flag = !snapshot.childSnapshot(forPath: self.user.uid).exists()
//        })
//        print(flag)
//        return flag
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.roomPicker.delegate = self
        self.roomPicker.dataSource = self
        roomPickerData = ["ROOM1","ROOM2","ROOM3","ROOM4"]
        self.userRef.observe(.value, with: {snapshot in
            if !snapshot.childSnapshot(forPath: self.user.uid).exists(){
                let alert = UIAlertController(title: "Profile", message: "Set your profile", preferredStyle: .alert)
                let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
                    guard let userNameField = alert.textFields?[0],
                        let roomNumberField = alert.textFields?[1],
                        let userNameEntered = userNameField.text,
                        let roomNumberEntered = roomNumberField.text else { return }
                    self.userRef.observe(.value, with: { snapshot in
                        let user = User(uid: self.user.uid, email: self.user.email!, userName: userNameEntered, roomReferenceNumber: roomNumberEntered)
                        let currentUserRef = self.userRef.child(self.user.uid)
                        currentUserRef.setValue(user.toAnyObject())
                        
                    })
    //                print(userNameField?.text)
    //                print(roomNumberField?.text)
                }
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                
                alert.addTextField { textUserName in
                    textUserName.placeholder = "Enter your user name"
                }
                alert.addTextField { textRoomNumber in
                    textRoomNumber.placeholder = "Enter your room number"
                }
                alert.addAction(saveAction)
                alert.addAction(cancelAction)
                self.present(alert,animated: true,completion: nil)
            }
        })

        switch self.biometricType() {
        case .faceID:
            faceIDButton.setImage(UIImage(named: "FaceIcon"),  for: .normal)
            bioMetricsLabel.text = "Unlock the Door with Face ID"
        default:
            faceIDButton.setImage(UIImage(named: "TouchIcon"),  for: .normal)
            bioMetricsLabel.text = "Unlock the Door with Touch ID"
        }
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func FaceID(_ sender: Any) {
        print("begin faceid")
        let context: LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Unlock the door with Face ID", reply: {(wasCorrect, error) in
                if wasCorrect {
                        self.ref.setValue("Door Unlocked")
                    sleep(5)
                    self.ref.setValue("Waiting Authorization")
                }
                else {
                    print("Incorrect")
                }
            })
        }
        else {
            print("didnt support face ID")
        }
    }
    
    @IBAction func signOutButtonDidTouch(_ sender: AnyObject) {
//        let user = Auth.auth().currentUser!

        try! Auth.auth().signOut()
        self.dismiss(animated: true, completion: nil)

    }
    
    
//    @IBAction func profileButtonDidTouch(_ sender: AnyObject) {
////        let alert = UIAlertController(title: "Profile", message: "View or Change Your Profile", preferredStyle: .alert)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
