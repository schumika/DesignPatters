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

        let item = dataManager.value(at: indexPath.row)
        cell.textLabel?.text = item.value
        let yellowItem = YellowBkgDisplayableValue(displayable: item)
        let greenItem = GreenDisplayableValue(displayable: yellowItem)
        cell.configure(with: greenItem)
        
        return cell
    }
}

extension UITableViewCell {
    func configure(with displayable: Displayable) {
        self.textLabel?.textColor = displayable.displayColor
        self.textLabel?.backgroundColor = displayable.backgroundColor
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
