//
//  CountryViewModel.swift
//  Bucket List
//
//  Created by Karl Cridland on 17/03/2024.
//

import Foundation
import UIKit

protocol CountryViewModel {
    
    var name: String { get }
    var view: CountryView { get }
    
}
