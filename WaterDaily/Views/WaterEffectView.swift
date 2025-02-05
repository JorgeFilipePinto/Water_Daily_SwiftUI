//
//  WaterEffect.swift
//  WaterDaily
//
//  Created by Jorge Pinto on 21/01/2025.
//

import SwiftUI

struct WaterEffectView: Shape {
    
    var progress: CGFloat
    var applitude: CGFloat = 10
    var waveLength: CGFloat = 20
    var phase: CGFloat = 0.0
    
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let midWidth = width / 2
        let progressHeigth = height * (1 - progress)
        
        path.move(to: CGPoint(x: 0, y: progressHeigth))
        
        for x in stride(from: 0, to: width + 10, by: 10) {
            let realtiveX = x/waveLength
            let normalizedLength = (x - midWidth) / midWidth
            let y = progressHeigth + sin(phase + realtiveX) * applitude * normalizedLength
            path.addLine(to: CGPoint(x: x, y: y))
            
        }
        
        path.addLine(to: CGPoint(x: width, y: progressHeigth))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeigth))
        
        return path
    }
    

}

/*
struct WaterEffect_Previews: PreviewProvider {
    static var previews: some View {
        WaterEffect(progress: 0.4, phase: 0.0)
            .fill(Color.blue)
            .ignoresSafeArea()
    }
}
*/
