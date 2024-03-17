//
//  Continent.swift
//  Bucket List
//
//  Created by Karl Cridland on 17/03/2024.
//

import Foundation

class Continent: ContinentViewModel {
    
    var name: String
    var countries: [String] = []
    
    init(_ name: String) {
        self.name = name
        self.getCountries()
    }
    
    func getCountries() {
        
    }
    
}
