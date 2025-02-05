//
//  WaterViewModel.swift
//  WaterDaily
//
//  Created by Jorge Pinto on 02/02/2025.
//

import SwiftUI

class WaterViewModel: ObservableObject {
    
    @AppStorage("waterGoal") var waterGoal: Int = 1000 {
        didSet {
            water.goal = waterGoal
            print("Goal updated to \(water.goal)")
        }
    }
    
    @AppStorage("dailyWater") var dailyWater: Int = 0 {
        didSet {
            print("\(dailyWater) drincked today.")
            water.dailyWater = dailyWater
        }
    }
    
    @AppStorage("progressStored") var progressStored: Double = 0
    
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
    
    func getProgress() -> CGFloat {
        return water.progress
    }
    
    
    func updateProgress() {
        water.progress = CGFloat( (Float(dailyWater) * 1) / (Float(waterGoal)) )
        progressStored = Double(water.progress)
    }

    func loadProgressStored() {
        water.progress = CGFloat(progressStored)
    }

    
    func reset() {
        dailyWater = 0
        print("Daily water reset.")
        waterGoal = 1000
        print( "Goal reset to \(waterGoal)")
    }

    
    func addWater(_ amount: Int) {
        dailyWater += amount
        print("\(amount) added to daily water")
    }
    

}


