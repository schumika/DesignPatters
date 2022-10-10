//
//  ValuesDataManager.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 20.06.2022.
//

import Foundation


protocol ValuesDataSaver {
    func save(value: String)
}

protocol ValuesDataSource {
    var numberOfElements: Int { get }
    func value(at ind: Int) -> String
}

typealias ValuesDataManagerProtocol = ValuesDataSaver & ValuesDataSource

class ValuesDataManager: ValuesDataManagerProtocol {
    private var values: [String] = []
    
    var numberOfElements: Int { self.values.count }
    func value(at ind: Int) -> String {
        self.values[ind]
    }
    
    func save(value: String) {
        // Saving...
        self.addNew(value)
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
