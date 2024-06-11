//
//  WeatherButton.swift
//  WeatherApp-SwiftUI
//
//  Created by Sedat on 11.06.2024.
//

import SwiftUI

struct WeatherButton: View {
    var buttonText: String
    var textColor: Color
    var backgroungColor: Color
    
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(backgroungColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(15)
    }
}

