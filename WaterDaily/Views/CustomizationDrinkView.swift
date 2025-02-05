//
//  CustomizationDrink.swift
//  WaterDaily
//
//  Created by Jorge Pinto on 02/02/2025.
//

import SwiftUI


struct CustomizationDrinkView: View {
    
    @Environment(\.dismiss) var dimiss
    @EnvironmentObject var waterViewModel: WaterViewModel


    let drink: DrinkSections
    let sizes = [100, 200, 300, 400, 500]

    @State private var size = 100 {
        didSet {
            print("Size \(size) selected")
        }
    }


    var body: some View {
        VStack {
            Form {
                Section("Basic options") {
                    Picker("Size", selection: $size) {
                        ForEach(sizes, id: \.self) { sizeValue in
                            Text("\(sizeValue)")
                                .tag(sizeValue)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            Button("Insert") {
                waterViewModel.addWater(size)
                waterViewModel.updateProgress()
                dimiss()
            }
            .padding()
        }
    }
}




#Preview {
    CustomizationDrinkView(drink: DrinkSections.example)
        .environmentObject(WaterViewModel())
}
