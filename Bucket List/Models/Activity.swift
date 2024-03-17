//
//  Activity.swift
//  Bucket List
//
//  Created by Karl Cridland on 17/03/2024.
//

import Foundation

class Activity: ActivityViewModel{
    
    var id: String
    var name: String
    
    var isAchieved: Bool
    var dateAchieved: TimeInterval?
    
    init(_ id: String, _ name: String){
        self.id = id
        self.name = name
        
        self.isAchieved = false
        self.dateAchieved = nil
        self.getData()
        
    }
    
    func getData() {
        if let time = UserDefaults.standard.value(forKey: self.id) as? TimeInterval{
            self.isAchieved = true
            self.dateAchieved = time
        }
    }
    
    func toggleComplete() {
        self.isAchieved = !self.isAchieved
        self.dateAchieved = self.isAchieved ? Date().timeIntervalSince1970 : nil
        self.save()
    }
    
    func save() {
        UserDefaults.standard.setValue(self.dateAchieved, forKey: self.id)
    }
    
}
