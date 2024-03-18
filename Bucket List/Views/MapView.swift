//
//  MapView.swift
//  Bucket List
//
//  Created by Karl Cridland on 18/03/2024.
//

import Foundation
import UIKit

class MapView: UIView {

    let map: Map
    
    required init?(coder aDecoder: NSCoder) {
        self.map = Map()
        super.init(coder: aDecoder)
        self.setBackgroundUI()
    }
    
    func setBackgroundUI(){
        self.map.countries.forEach { country in
            self.addSubview(country.view)
            country.view.fillContainer(self, 0)
        }
    }

}
