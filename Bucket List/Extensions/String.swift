//
//  String.swift
//  Bucket List
//
//  Created by Karl Cridland on 18/03/2024.
//

import Foundation
import UIKit

extension String {
    
    func svgToCGPoints() -> [CGPoint] {
        var points: [CGPoint] = []
        var currentPoint: CGPoint = .zero

        let commands = self.components(separatedBy: CharacterSet(charactersIn: "MLC")).filter { !$0.isEmpty }
        
        for command in commands {
            var components = command.components(separatedBy: .whitespaces)
            if components.isEmpty {
                continue
            }
            
            let action = components.removeFirst()
            let absolute = action.first?.isUppercase ?? false
            
            switch action.uppercased() {
            case "M":
                if let x = Float(components[0]), let y = Float(components[1]) {
                    currentPoint = CGPoint(x: CGFloat(x), y: CGFloat(y))
                    points.append(currentPoint)
                }
            case "L":
                for i in stride(from: 0, to: components.count, by: 2) {
                    if let x = Float(components[i]), let y = Float(components[i + 1]) {
                        currentPoint = absolute ? CGPoint(x: CGFloat(x), y: CGFloat(y)) : currentPoint + CGPoint(x: CGFloat(x), y: CGFloat(y))
                        points.append(currentPoint)
                    }
                }
            case "Z":
                if let firstPoint = points.first {
                    points.append(firstPoint)
                    currentPoint = firstPoint
                }
            default:
                break
            }

        }
        
        return points
    }
    
}

