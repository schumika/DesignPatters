//
//  OtherDataSource.swift
//  SOLIDExample
//
//  Created by Calugar Anca Maria on 21.06.2022.
//

import Foundation

class OtherDataSource: ValuesDataSource {
    override func save(value: String) -> Bool {
        if !values.contains(value) {
            self.values.append(value)
            return true
        }
        return false
    }
}
