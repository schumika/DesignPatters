//
//  ValuesViewController.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 20.06.2022.
//

import UIKit



class ValuesViewController: UITableViewController {
    
    var dataManager: ValuesDataManager!
    
    @IBOutlet override var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "ValueTableViewCell", bundle: nil), forCellReuseIdentifier: "ValueCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ValueCell", for: indexPath) as! ValueTableViewCell

        let item = dataManager.value(at: indexPath.row)
        cell.configure(with: TxtDisplayableValue(displayable: BkgDisplayableValue(displayable: item, backgroundColor: .lightGray)))
        
        return cell
    }
}

extension ValuesViewController {
    func getAddNewValueViewController() -> AddNewValueViewController {
        let addNewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNewValueViewController") as? AddNewValueViewController ?? AddNewValueViewController()
        
        addNewVC.onSave = { [weak self] value in
            self?.dataManager.save(value: value)
        }
        
        return addNewVC
    }
}
