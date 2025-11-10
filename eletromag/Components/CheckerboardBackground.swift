//
//  CheckerboardBackground.swift
//  eletromag
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 02/11/25.
//
import SwiftUI

struct CheckerboardBackground: View {
    var body: some View {
        Canvas { context, size in
            let step: CGFloat = 20
            var path = Path()
            for x in stride(from: 0, through: size.width, by: step) {
                path.move(to: CGPoint(x: x, y: 0))
                path.addLine(to: CGPoint(x: x, y: size.height))
            }
            for y in stride(from: 0, through: size.height, by: step) {
                path.move(to: CGPoint(x: 0, y: y))
                path.addLine(to: CGPoint(x: size.width, y: y))
            }
            context.stroke(path, with: .color(.gray.opacity(0.35)), lineWidth: 0.5)
        }
    }
}
