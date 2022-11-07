//
//  TxtDisplayableValue.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 07.11.2022.
//

import UIKit

class TxtDisplayableValue: Displayable {
    private let displayable: Displayable
    private let txtColor: UIColor
    
    init(displayable: Displayable, textColor: UIColor = .systemPurple) {
        self.displayable = displayable
        self.txtColor = textColor
    }
    
    var backgroundColor: UIColor { displayable.backgroundColor }
    var text: String { displayable.text }
    var textColor: UIColor { txtColor }
}
