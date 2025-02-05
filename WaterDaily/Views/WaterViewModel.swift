//
//  WaterViewModel.swift
//  WaterDaily
//
//  Created by Jorge Pinto on 02/02/2025.
//

import Foundation

class WaterViewModel: ObservableObject {
    @Published var water = Water()
    
    let defaultGoals = [
        1000,
        1500,
        2000,
        2500,
        3000,
        3500,
        4000,
    ]
    
    var setGoal: Int {
        get {
            return water.goal
        }
        set(setGoal) {
            water.goal = setGoal
        }
    }
    
    var dailywater: Int {
        return water.dailyWater
    }
    
    
    var progress: CGFloat {
        return CGFloat( (Float(water.dailyWater) * 1) / (Float(water.goal)) )
    }

    
    func addWater(_ amount: Int) {
        water.dailyWater += amount
        print("\(amount) added to daily water")
    }
    
    
    func setGoal(goal: Int) {
        water.goal = goal
    }
}


