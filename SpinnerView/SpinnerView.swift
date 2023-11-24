//
//  ContentView.swift
//  Rings
//
//  Created by Sanjeev Bharti on 11/23/23.
//

import SwiftUI

enum SpinnerSize {
    case small
    case medium
    case large
    
    var height: CGFloat {
        switch self {
        case .small:
            return 25
        case .medium:
            return 30
        case .large:
            return 40
        }
    }
}


struct SpinnerView: View {
    
    @State private var startAnimation = false
   
    private let size: SpinnerSize
    private let color: Color
    private let lineWidth: CGFloat
    private let speed: CGFloat
    
    init(size: SpinnerSize = .small,
         color: Color = .primary,
         lineWidth: CGFloat = 2.0,
         speed: CGFloat = 1.0) {
        
        self.size = size
        self.color = color
        self.lineWidth = lineWidth
        self.speed = speed
    }
    
    var body: some View {
        
        Circle()
            .trim(from: 0.0, to: 0.9)
            .stroke(color, lineWidth: lineWidth)
            .rotationEffect(.degrees(startAnimation ? 360 : 0.0))
            .frame(height: size.height)
            .animation(.linear(duration: speed).repeatForever(autoreverses: false), value: startAnimation)
            .onAppear(perform: {
                startAnimation.toggle()
            })
    }
}

#Preview {
    VStack(spacing: 60.0) {
        SpinnerView()
        SpinnerView(size: .medium, color: .blue, speed: 3.0)
        SpinnerView(size: .large, color: .green, speed: 4.0)
        
        SpinnerView(size: .medium, color: .cyan, lineWidth: 4.0, speed: 1.5)
        SpinnerView(size: .large, color: .pink, lineWidth: 6.0)
        SpinnerView(size: .medium, color: .brown, lineWidth: 3.0)
    }
}

