//
//  ValueTableViewCell.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 07.11.2022.
//

import UIKit

final class ValueTableViewCell: UITableViewCell {
    @IBOutlet private weak var valueLabel: UILabel!
    
    func configure(with displayable: Displayable) {
        self.valueLabel?.text = displayable.text
        self.valueLabel?.textColor = displayable.textColor
        self.valueLabel?.backgroundColor = displayable.backgroundColor
    }
}
