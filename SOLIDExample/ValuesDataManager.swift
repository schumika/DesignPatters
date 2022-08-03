//
//  ValuesDataManager.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 20.06.2022.
//

import Foundation


class ValuesDataManager {
    private var values: [DisplayableValue] = []
    
    var numberOfElements: Int { self.values.count }
    func value(at ind: Int) -> DisplayableValue {
        self.values[ind]
    }
    
    func save(value: String) {
        // Saving...
        self.addNew(value)
    }
}

extension ValuesDataManager {
    func addNew(_ value: String) {
        self.values.append(DisplayableValue(value: value))
    }
    
    func containsValue(_ val: String) -> Bool {
        self.values.map { $0.value }.contains(val)
    }
}
