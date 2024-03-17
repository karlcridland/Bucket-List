//
//  ActivityViewModel.swift
//  Bucket List
//
//  Created by Karl Cridland on 17/03/2024.
//

import Foundation

protocol ActivityViewModel{
    
    var id: String { get }
    var name: String { get }
    
    var isAchieved: Bool { get set }
    var dateAchieved: TimeInterval? { get set }
    
    func getData()
    func toggleComplete()
    func save()
    
}
