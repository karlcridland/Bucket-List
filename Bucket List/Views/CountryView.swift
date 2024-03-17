//
//  CountryView.swift
//  Bucket List
//
//  Created by Karl Cridland on 17/03/2024.
//

import Foundation
import UIKit

class CountryView: UIImageView {
    
    let country: Country
    
    init(_ country: Country){
        self.country = country
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
