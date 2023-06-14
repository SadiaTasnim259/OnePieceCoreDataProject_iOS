//
//  TypeDisplayListViewController.swift
//  OnePieceCoreDataProject
//
//  Created by Sadia on 14/6/23.
//

import UIKit

class TypeDisplayListViewController: UIViewController {
    
    var databaseManager = DatabaseManager()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var devilFruitType: [FruitTypeEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        devilFruitType = databaseManager.fetchData()
        tableView.reloadData()
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let typeRegisterViewController = self.storyboard?.instantiateViewController(withIdentifier: "TypeRegisterViewController") as! TypeRegisterViewController
        self.navigationController?.pushViewController(typeRegisterViewController, animated: true)
    }
}

// MARK: - TableView

extension TypeDisplayListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        devilFruitType.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else{
            return UITableViewCell()
        }
        let fruitType = devilFruitType[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = fruitType.fruitTypeName
        cell.contentConfiguration = content
        return cell
    }
}

extension TypeDisplayListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
}

// MARK: - Search Bar

extension TypeDisplayListViewController: UISearchBarDelegate {
    //MARK:- SEARCH BAR DELEGATE METHOD FUNCTION
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        
        devilFruitType = databaseManager.fetchData()
        
        searchBar.endEditing(true)
        tableView.reloadData() ///sob data dekhabe
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            devilFruitType = databaseManager.fetchData()
        }else{
            devilFruitType = databaseManager.fetchSearchedData(keyword: searchText)
        }
        
        tableView.reloadData()
    }
}
