//
//  ContinentViewModel.swift
//  Bucket List
//
//  Created by Karl Cridland on 17/03/2024.
//

import Foundation

protocol ContinentViewModel {
    
    var name: String { get }
    var countries: [String] { get }
    
    func getCountries()
    
}
