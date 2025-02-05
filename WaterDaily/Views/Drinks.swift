//
//  Water.swift
//  WaterDaily
//
//  Created by Jorge Pinto on 02/02/2025.
//

import Foundation


class Drinks: ObservableObject, Codable {
    
    let drinks: [DrinkSections]
    
    init() {
        do {
            let url = Bundle.main.url(forResource: "drinks", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let menuData = try JSONDecoder().decode(Drinks.self, from: data)
            
            drinks = menuData.drinks
            
        } catch {
            fatalError("drinks.json is missing our corrupt.")
        }
    }
    
    
}
