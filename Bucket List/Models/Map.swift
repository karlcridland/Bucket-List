//
//  Map.swift
//  Bucket List
//
//  Created by Karl Cridland on 18/03/2024.
//

import Foundation

class Map: MapViewModel {
    
    var countries: [Country] = World.allCountries()
    
    init() {}
    
}
