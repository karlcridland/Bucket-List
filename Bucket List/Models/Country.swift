//
//  Country.swift
//  Bucket List
//
//  Created by Karl Cridland on 17/03/2024.
//

import Foundation
import UIKit

class Country: CountryViewModel {
    
    var view: CountryView
    
    var name: String
    
    init(_ name: String){
        self.name = name
        self.view = CountryView(name)
    }
    
    func imageName() -> String{
        return self.name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
}
