//
//  ViewController.swift
//  OnePieceCoreDataProject
//
//  Created by Sadia on 14/6/23.
//

import UIKit

class TypeRegisterViewController: UIViewController {
    
    let databaseManager = DatabaseManager()

    @IBOutlet weak var fruitTypeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let fruitTypeName = fruitTypeTextField.text, !fruitTypeName.isEmpty else {
            openAlert(title: "Alert", message: "Please enter your fruit type")
            return
        }
        
        let newFruitType = FriutTypeModel(fruitTypeName: fruitTypeName)
        databaseManager.addData(newFruitType)
        showAlert(message: "Fruit Type Added")
    }
}

// MARK: - Alerts
    extension TypeRegisterViewController{
        func openAlert(title: String, message: String) -> Void {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

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
