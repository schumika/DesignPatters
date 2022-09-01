//
//  ValuesDataManager.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 20.06.2022.
//

import Foundation

class ValuesDataManager: ObservableObject {
    private var values: [String] = [] {
        didSet {
            self.hasWarning = values.count > 1
        }
    }
    
    var numberOfElements: Int { self.values.count }
    func value(at ind: Int) -> String {
        self.values[ind]
    }
    
    func save(value: String) {
        // Saving...
        self.addNew(value)
        
    }
    
    func remove(at idx: Int) {
        self.values.remove(at: idx)
    }
    
    @Published var hasWarning: Bool = false
}

extension ValuesDataManager {
    func addNew(_ value: String) {
        self.values.append(value)
    }
    
    func containsValue(_ val: String) -> Bool {
        self.values.contains(val)
    }
}
