//
//  Water Text.swift
//  WaterDaily
//
//  Created by Jorge Pinto on 27/01/2025.
//

import SwiftUI

struct TextView: View {
    
    let text: String
    let water: Int
    
    var body: some View {
        VStack(alignment: .center) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("\(water)ml")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
    }
}


struct WaterText_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "💧 Let's Drink Water", water: 100)
    }
}
