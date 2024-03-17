//
//  ActivityView.swift
//  Bucket List
//
//  Created by Karl Cridland on 17/03/2024.
//

import Foundation
import UIKit

class ActivityView: UIView {
    
    let activity: Activity
    
    init(_ activity: Activity) {
        self.activity = activity
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
