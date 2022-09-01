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
    
    var footerView = LabelView()
    
    @IBAction func addBtnClicked(_ sender: Any) {
        let addNewVC = self.getAddNewValueViewController()        
        self.navigationController?.pushViewController(addNewVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.add(subscriber: self)
        dataManager.add(subscriber: footerView)
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataManager.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
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

extension ValuesViewController: ValuesSubscriber {
    func update(hasWarning: Bool) {
        let prefix = hasWarning ? "⚠️" : ""
        self.title = "\(prefix) Values"
    }
}

class LabelView: UIView {
    var sign: String = "⭐️" {
        didSet {
            self.label.text = sign
        }
    }
    private let label: UILabel
    
    override init(frame: CGRect) {
        label = UILabel()
        
        super.init(frame: frame)
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        [label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20.0),
         label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20.0),
         label.topAnchor.constraint(equalTo: self.topAnchor),
         label.bottomAnchor.constraint(equalTo: self.bottomAnchor),]
            .forEach { self.addConstraint($0) }
        
        label.text = sign
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LabelView: ValuesSubscriber {
    func update(hasWarning: Bool) {
        self.sign = hasWarning ? "😬" : "⭐️"
    }
}
