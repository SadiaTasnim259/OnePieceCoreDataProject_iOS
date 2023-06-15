//
//  FruitTypeDetailViewController.swift
//  OnePieceCoreDataProject
//
//  Created by Sadia on 14/6/23.
//

import UIKit

class FruitTypeDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var fruitTypeName: String?
    var databaseManager = DatabaseManager()
    var fruitDetail: [FruitDetailsEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        nameLabel.text = "\(fruitTypeName!) Type"
        tableView.register(UINib(nibName: "FruitTypeDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "FruitTypeDetailTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fruitDetail = databaseManager.fetchFruitDetailData(type: fruitTypeName!)
        tableView.reloadData()
    }

    @IBAction func addUserButtonTapped(_ sender: UIBarButtonItem) {
        
        let fruitUserRegisterViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitUserRegisterViewController") as! FruitUserRegisterViewController
        fruitUserRegisterViewController.fruitTypeName = fruitTypeName
        self.navigationController?.pushViewController(fruitUserRegisterViewController, animated: true)
    }
}

// MARK: - tableView

extension FruitTypeDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruitDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FruitTypeDetailTableViewCell") as? FruitTypeDetailTableViewCell else{
            return UITableViewCell()
        }
        let details = fruitDetail[indexPath.row]
        cell.setup(fruitDetail: details)
        return cell
    }
}

extension FruitTypeDetailViewController: UITableViewDelegate{
    
}

