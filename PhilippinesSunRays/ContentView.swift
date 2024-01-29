//
//  ContentView.swift
//  PhilippinesSunRays
//
//  Created by Don Jose on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ForEach(0 ..< 8) { item in
                SunRays()
                    .frame(width: 150, height: 150)
                    .clipped()
                    .rotationEffect(.degrees(Double(item) * 45))
                    .foregroundColor(.GoldenYellow)
            }
            .position(x: geometry.size.width * 0.5,
                      y: geometry.size.height * 0.5)
        }
    }
}

#Preview {
    ContentView()
}

extension Color {
    static let GoldenYellow = Color(#colorLiteral(red: 0.9934179187, green: 0.8445430398, blue: 0.09630902857, alpha: 1))
}

struct SunRays: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let startingAngle = 45.0
            let gapAngle = 3.75
            
            func point(_ angle: Double) -> CGPoint {
                .init(x: rect.midX + cos(angle) * rect.width,
                      y: rect.midY + sin(angle) * rect.width)
            }
            
            func addLines(start: Double, end: Double) {
                path.addLines([.init(x: rect.midX, y: rect.midY),
                               point(computeAngle(start)),
                               point(computeAngle(end))])
            }
            
            func computeAngle(_ value: Double) -> Double {
                (startingAngle + value) * Double.pi/180
            }
            
            addLines(start: -gapAngle * 3, end: -gapAngle * 2)
            addLines(start: -gapAngle, end: gapAngle)
            addLines(start: gapAngle * 3, end: gapAngle * 2)
        }
    }
}
