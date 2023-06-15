//
//  FruitUserRegisterViewController.swift
//  OnePieceCoreDataProject
//
//  Created by Sadia on 14/6/23.
//

import UIKit

class FruitUserRegisterViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var fruitNameField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var imageURLField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var databaseManager = DatabaseManager()
    var fruitTypeName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "\(fruitTypeName!) Type"
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let fruitName = fruitNameField.text, !fruitName.isEmpty else {
            openAlert(message: "Please enter Fruit Name")
            return
        }
        guard let userName = userNameField.text, !userName.isEmpty else {
            openAlert(message: "Please enter User Name")
            return
        }
        guard let imageURL = imageURLField.text, !imageURL.isEmpty else {
            openAlert(message: "Please enter user URL")
            return
        }
         let newFruitName = FruitDetailsModel(fruitName: fruitName, userName: userName, imageURL: imageURL, fruitType: fruitTypeName!)
        databaseManager.addFruitDetailsData(newFruitName)
        showAlert(message: "User Added")
    }
    
}

// MARK: - Alerts
extension FruitUserRegisterViewController{
    func openAlert( message: String) -> Void {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)

        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)

        alert.addAction(okButton)

        self.present(alert, animated: true)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { _ in
            self.navigationController?.popViewController(animated: true)
        }

        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
