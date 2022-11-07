//
//  DisplayableValue.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 03.08.2022.
//

import UIKit

protocol Displayable {
    var text: String { get }
    var textColor: UIColor { get }
    var backgroundColor: UIColor { get }
}

final class DisplayableValue: Displayable {
    private let value: String
    
    init(value: String) {
        self.value = value
    }
    
    var text: String { value }
    var textColor: UIColor {  .systemBlue }
    var backgroundColor: UIColor { .systemMint }
}
