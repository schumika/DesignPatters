//
//  ValuesDataManager.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 20.06.2022.
//

import Foundation

protocol DataSaver {
    func save(value: String) -> Bool
}

class ValuesDataManager: DataSaver {
    private var values: [String] = []
    
    var numberOfElements: Int { self.values.count }
    func value(at ind: Int) -> String {
        self.values[ind]
    }
    
    func save(value: String) -> Bool {
        // Saving...
        self.addNew(value)
        return true
    }
}

extension ValuesDataManager {
    func addNew(_ value: String) {
        self.values.append(value)
    }
    
    func containsValue(_ val: String) -> Bool {
        self.values.contains(val)
    }
}

class UniqueValuesDataManager: ValuesDataManager {
    override func save(value: String) -> Bool {
        guard !containsValue(value) else { return false }
        self.addNew(value)
        return true
    }
}
