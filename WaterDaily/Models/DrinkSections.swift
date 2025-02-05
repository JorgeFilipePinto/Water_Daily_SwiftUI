//
//  DrinkSections.swift
//  WaterDaily
//
//  Created by Jorge Pinto on 02/02/2025.
//

import Foundation


struct DrinkSections: Identifiable, Codable {
    let id: UUID
    let name: String
    let waterPercentage: Double
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    static let example = DrinkSections(id: UUID(), name: "water", waterPercentage: 100.0)
 
}
