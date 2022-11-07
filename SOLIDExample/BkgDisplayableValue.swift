//
//  YellowBkgDisplayableValue.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 07.11.2022.
//

import UIKit

class BkgDisplayableValue: Displayable {
    private let displayable: Displayable
    private let bkgColor: UIColor
    
    init(displayable: Displayable, backgroundColor: UIColor = UIColor.systemYellow) {
        self.displayable = displayable
        self.bkgColor = backgroundColor
    }
    
    var backgroundColor: UIColor { bkgColor }
    var textColor: UIColor { displayable.textColor }
    var text: String { displayable.text }
}
