//
//  ValuesViewController.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 20.06.2022.
//

import UIKit



class ValuesViewController: UITableViewController {
    
    var dataManager: ValuesDataManagerProtocol!
    
    @IBOutlet override var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    @IBAction func addBtnClicked(_ sender: Any) {
        let addNewVC = self.getAddNewValueViewController()        
        self.navigationController?.pushViewController(addNewVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
}

extension ValuesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.numberOfElements
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ValueCell") ?? UITableViewCell(style: .default, reuseIdentifier: "ValueCell")

        let value = dataManager.value(at: indexPath.row)
        cell.textLabel?.text = value
        
        return cell
    }
}

extension ValuesViewController {
    func getAddNewValueViewController() -> AddNewValueViewController {
        let addNewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNewValueViewController") as? AddNewValueViewController ?? AddNewValueViewController()
        
        addNewVC.dataManager = self.dataManager
        
        return addNewVC
    }
}
