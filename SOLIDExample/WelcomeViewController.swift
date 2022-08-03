//
//  WelcomeViewController.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 22.06.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBAction func continueClicked(_ sender: Any) {
        let vc = self.getValuesViewController()
        vc.dataManager = ValuesDataManager.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension WelcomeViewController {
    func getValuesViewController() -> ValuesViewController {
        let valuesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ValuesViewController") as? ValuesViewController ?? ValuesViewController()
        return valuesVC
    }
}
