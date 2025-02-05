//
//  Welcome.swift
//  WaterDaily
//
//  Created by Jorge Pinto on 27/01/2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var showingAddScreen = false
    
    @StateObject var waterViewModel = WaterViewModel()
    
    @State private var phase: CGFloat = 0.0
 
    var body: some View {
        ZStack {
            
            WaterEffectView(progress: waterViewModel.getProgress(), phase: phase)
                .fill(Color.blue)
                .ignoresSafeArea()
                .onAppear() {
                    waterViewModel.loadProgressStored()
                    waterViewModel.updateProgress()
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        phase = .pi * 2
                    }
                }
            VStack {
                HStack {
                    Button("RESET") {
                        waterViewModel.reset()
                        waterViewModel.updateProgress()
                    }
                    .padding()
                    Spacer()
                    Picker("Goal", selection: $waterViewModel.waterGoal) {
                        ForEach(waterViewModel.defaultGoals, id: \.self) { sizeValue in
                            Text("\(sizeValue)")
                                .tag(sizeValue)
                        }
                    }
                    .pickerStyle(.menu)
                    .padding()
                    .onChange(of: waterViewModel.waterGoal) { _ in
                        waterViewModel.updateProgress()
                    }
                }
                
                Spacer()
                
                Button {
                    print(Date())
                    showingAddScreen = true
                }
                label: {
                    TextView(text: "💧 Lets drink water!", water: Int(waterViewModel.dailyWater))
                }
                
            }
            .sheet(isPresented: $showingAddScreen) {
                MenuView()
                    .environmentObject(waterViewModel)
            }
        }
    }
}




struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
