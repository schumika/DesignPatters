//
//  DisplayableValue.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 03.08.2022.
//

import UIKit

protocol Displayable {
    var displayColor: UIColor { get }
    var backgroundColor: UIColor { get }
}

final class DisplayableValue: Displayable {
    var value: String
    
    private var color: UIColor = .blue
    private var bkgColor: UIColor = .systemPink
    
    init(value: String) {
        self.value = value
    }
    
    var displayColor: UIColor { color }
    var backgroundColor: UIColor { bkgColor }
}

class YellowBkgDisplayableValue: Displayable {
    var displayable: Displayable
    
    init(displayable: Displayable) {
        self.displayable = displayable
    }
    
    var displayColor: UIColor { displayable.displayColor }
    var backgroundColor: UIColor { .systemYellow }
}

class GreenDisplayableValue: Displayable {
    var displayable: Displayable
    
    init(displayable: Displayable) {
        self.displayable = displayable
    }
    
    var displayColor: UIColor { .green }
    var backgroundColor: UIColor { displayable.backgroundColor }
}
