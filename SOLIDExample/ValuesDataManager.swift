//
//  ValuesDataManager.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 20.06.2022.
//

import Foundation

protocol ValuesSubscriber {
    func update(hasWarning: Bool)
}

class ValuesDataManager {
    private var values: [String] = [] {
        didSet {
            self.hasWarning = values.count > 1
        }
    }
    private var subscribers = [ValuesSubscriber]()
    
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
    
    private var hasWarning: Bool = false {
        didSet {
            self.notifySubscribers()
        }
    }
}

// Subscriber methods
extension ValuesDataManager {
    func add(subscriber: ValuesSubscriber) {
        subscribers.append(subscriber)
    }
    
    func remove(subscriber filter: (ValuesSubscriber) -> (Bool)) {
        guard let index = subscribers.firstIndex(where: filter) else { return }
        subscribers.remove(at: index)
    }
    
    private func notifySubscribers() {
        subscribers.forEach({ $0.update(hasWarning: self.hasWarning) })
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
