//
//  WorldViewModel.swift
//  Bucket List
//
//  Created by Karl Cridland on 18/03/2024.
//

import Foundation

protocol WorldViewModel {
    
    static var continents: [ContinentVal: Continent] { get }
    static var areContinentsSet: Bool { get }
    
    static func setContinents()
    static func getContinent(_ continent: ContinentVal) -> Continent?
    static func allCountries() -> [Country]
    
}
