//
//  CountryView.swift
//  Bucket List
//
//  Created by Karl Cridland on 17/03/2024.
//

import Foundation
import UIKit

class CountryView: UIImageView {
    
    let name: String

    init(_ name: String) {
        self.name = name
        super.init(frame: .zero)
        self.getPlotPoints(name) { paths in
            paths.forEach { points in
                points.forEach { point in
                    print(point)
                }
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
