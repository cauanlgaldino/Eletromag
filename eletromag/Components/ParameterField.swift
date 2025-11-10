//
//  ParameterField.swift
//  eletromag
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 02/11/25.
//
import SwiftUI

struct ParameterField: View {
    let title: String
    @Binding var value: Double

    var body: some View {
        HStack {
            Text(title)
            Spacer(minLength: 16)
            TextField("0", value: $value, format: .number.precision(.fractionLength(8)))
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.trailing)
                .keyboardType(.decimalPad)
                .frame(minWidth: 140)
        }
    }
}
