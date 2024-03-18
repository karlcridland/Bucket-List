//
//  UIView.swift
//  Bucket List
//
//  Created by Karl Cridland on 18/03/2024.
//

import Foundation
import UIKit

extension UIView {
    
    func fillContainer(_ parent: UIView, _ left: CGFloat, _ right: CGFloat, _ top: CGFloat, _ bottom: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: parent.leftAnchor, constant: 0),
            self.rightAnchor.constraint(equalTo: parent.rightAnchor, constant: 0),
            self.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 0)
        ])
    }
    
    func fillContainer(_ parent: UIView, _ padding: CGFloat){
        self.fillContainer(parent, padding, padding, padding, padding)
    }
    
    func appendNib(_ nibName: String){
        let nib = UINib(nibName: nibName, bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else{
            fatalError("Unable to convert nib")
        }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
    func getPlotPoints(_ country: String, _ onComplete: @escaping ([[CGPoint]])->Void){
        if let path = Bundle.main.path(forResource: "country_plot_data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let jsonString = String(data: data, encoding: .utf8) {
                    if let jsonData = jsonString.data(using: .utf8) {
                        if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: [String]] {
                            var paths: [[CGPoint]] = []
                            if let svgDataSets = json[country] {
                                svgDataSets.forEach { svgData in
                                    let coordinates = svgData.components(separatedBy: CharacterSet(charactersIn: "MLC")).filter { !$0.isEmpty }
                                    coordinates.forEach { coords in
                                        paths.append(coords.svgToCGPoints())
                                    }
                                }
                            }
                            print(paths)
                            onComplete(paths)
                        }
                    }
                }
            } catch {
                print("Error loading JSON file:", error)
            }
        }
    }

    
}
extension CGPoint {
    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
}
