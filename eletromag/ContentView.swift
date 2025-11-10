//
//  ContentView.swift
//  eletromag
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 02/11/25.
//
import SwiftUI

struct ContentView: View {

    @State private var metersPerPointReference: Double? = nil

    @State private var mass: Double = 1.0e-28
    
    private let minimumMass: Double = 9.11e-31
    private let maximumMass: Double = 1.67e-27
    
    @State private var velocity: Double = 3.0e6

    private let minimumVelocity: Double = 1.0e5
    private let maximumVelocity: Double = 1.0e7

    @State private var magneticFieldMagnitude: Double = 0.2
    
    private let minimumMagneticFieldMagnitude: Double = 0.05
    private let maximumMagneticFieldMagnitude: Double = 1.0

    private var chargeMagnitude: Double = 1.6e-19
    
    private let minimumChargeMagnitude: Double = 1.6e-19
    private let maximumChargeMagnitude: Double = 3.2e-19

    private var globalMaximumReferenceRadiusMeters: Double {
        (maximumMass * maximumVelocity) / (minimumMagneticFieldMagnitude * minimumChargeMagnitude)
    }
    
    var trajectoryRadiusMeters: Double? {
        let denominator = magneticFieldMagnitude * abs(chargeMagnitude)
        guard denominator > 0 else { return nil }
        return (mass * velocity) / denominator
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                VStack(spacing: 12) {
                    VStack(alignment: .leading) {
                        Text("Massa (kg): \(mass, format: .number.notation(.scientific).precision(.fractionLength(2)))")
                        Slider(value: $mass, in: minimumMass...maximumMass)
                    }
                    VStack(alignment: .leading) {
                        Text("Velocidade (m/s): \(velocity, format: .number.grouping(.automatic).precision(.fractionLength(0)))")
                        Slider(value: $velocity, in: minimumVelocity...maximumVelocity)
                    }
                    VStack(alignment: .leading) {
                        Text("Campo magnético, |B| (T): \(magneticFieldMagnitude, format: .number.precision(.fractionLength(3)))")
                        Slider(value: $magneticFieldMagnitude, in: minimumMagneticFieldMagnitude...maximumMagneticFieldMagnitude)
                    }
                    VStack(alignment: .leading) {
                        Text("Módulo da carga |q| (C): \(chargeMagnitude, format: .number.notation(.scientific).precision(.fractionLength(2))) (Elétron)")
                            .padding(.bottom, -100)
                        Slider(value: .constant(chargeMagnitude), in: minimumChargeMagnitude...maximumChargeMagnitude)
                            .padding(.bottom, -100)
                            .hidden()
                    }
                    
                    Text("Raio da trajetória (r): \(trajectoryRadiusMeters ?? 0.0, format: .number.precision(.fractionLength(6))) m")
                                                            .font(.headline)
                                                            .accessibilityIdentifier("trajectoryRadiusLabel")
                                                            .padding()
                                                            .background(.ultraThinMaterial, in: .capsule)
                                                            .padding(.top, 24)
                }
                .padding(.horizontal)
                
                
                .padding(.horizontal)
                
                GeometryReader { geometry in
                    ZStack {
                        CheckerboardBackground()
                            .opacity(0.9)
                                
                                if let trajectoryRadiusMeters {
                                    let availableHalfSpan = min(geometry.size.width, geometry.size.height) * 0.48
                                    
                                    let metersPerPoint: Double = {
                                        if let metersPerPointReference {
                                            return metersPerPointReference
                                        } else {
                                            let initialScale = max(globalMaximumReferenceRadiusMeters / availableHalfSpan, 1e-9)
                                            DispatchQueue.main.async {
                                                self.metersPerPointReference = initialScale
                                            }
                                            return initialScale
                                        }
                                    }()
                                    
                                    let trajectoryRadiusPoints = trajectoryRadiusMeters / metersPerPoint
                                    let diameterPoints = trajectoryRadiusPoints * 2.0
                                    
                                    Circle()
                                        .strokeBorder(style: StrokeStyle(lineWidth: 3, dash: [6, 6]))
                                        .foregroundStyle(.blue)
                                        .frame(width: diameterPoints, height: diameterPoints)
                                    
                                    Path { path in
                                        let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                                        path.move(to: CGPoint(x: center.x - trajectoryRadiusPoints, y: center.y))
                                        path.addLine(to: CGPoint(x: center.x + trajectoryRadiusPoints, y: center.y))
                                        path.move(to: CGPoint(x: center.x, y: center.y - trajectoryRadiusPoints))
                                        path.addLine(to: CGPoint(x: center.x, y: center.y + trajectoryRadiusPoints))
                                    }
                                    .stroke(.gray.opacity(0.5), lineWidth: 1)
                                    
                                    Circle()
                                        .fill(.red)
                                        .frame(width: 10, height: 10)
                                        .position(x: geometry.size.width / 2 + trajectoryRadiusPoints,
                                                  y: geometry.size.height / 2)
                                    
                                } else {
                                    Text("Sem raio calculado")
                                        .foregroundStyle(.secondary)
                        }
                        
                    }
                }
//                .padding()
            }
            .padding(.top)
            .navigationTitle("Calculadora de Raio da Trajetória")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
