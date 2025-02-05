//
//  MenuView.swift
//  WaterDaily
//
//  Created by Jorge Pinto on 02/02/2025.
//
import Foundation
import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var waterViewModel: WaterViewModel
    
    var drinks = Drinks()
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    Section {
                        ForEach(drinks.drinks) { drink in
                            NavigationLink {
                                CustomizationDrink(drink: drink)
                                    .environmentObject(waterViewModel)
                                    .onAppear() {
                                        print("\(drink.name) selected")
                                    }
                            } label: {
                                VStack {
                                    Image(drink.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                    
                                    Text(drink.name)
                                        .font(.system(.body, design: .serif))
                                }
                                .padding(.bottom)
                            }
                            .buttonStyle(.plain)
                        }
                    } header: {
                        Text("Drinks")
                            .font(.system(.title, design: .serif))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.top, .bottom, .trailing], 5)
                            .background(.background)
                    }
                }
                .navigationTitle("Add Drink")
            }
        }
    }
}

#Preview {
    MenuView()
}
