//
//  AddNewValueViewController.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 20.06.2022.
//

import UIKit

class AddNewValueViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneLabel: UILabel!
    
    var onSave:(String)->() = { _ in }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.textField.becomeFirstResponder()
    }
    
    
    @IBAction func doneClicked(_ sender: Any) {
        self.onSave(self.textField.text ?? "")
        self.onDone()
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func onDone() {
        self.doneLabel.isHidden = false
        self.doneLabel.layer.opacity = 1.0
        
        UIView.animate(withDuration: 0.5) {
            self.doneLabel.transform = CGAffineTransform(scaleX: 10.0, y: 10.0)
            self.doneLabel.layer.opacity = 0.0
        } completion: { _ in
            self.doneLabel.transform = CGAffineTransform.identity
            self.doneLabel.isHidden = true
            self.navigationController?.popViewController(animated: true)
        }
    }
}






















/*
 let alert = UIAlertController(title: "Error", message: "Please try again", preferredStyle: .alert)
 alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
 self.present(alert, animated: true, completion: nil)
 */
