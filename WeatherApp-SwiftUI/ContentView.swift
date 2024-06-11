//
//  ContentView.swift
//  WeatherApp-SwiftUI
//
//  Created by Sedat on 10.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
     
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("myColor"))
            VStack {
                CityTextView(cityName: "Seattle, WA")
                MainWeatherStatusView(imageName: isNight ? "cloud.moon.rain.fill" : "cloud.sun.fill", temperature: 34)
                HStack(spacing: 25){
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.bolt.rain.fill", temperature: 10)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 35)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.drizzle.fill", temperature: 18)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sleet.fill", temperature: 5)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.bolt.fill", temperature: 21)
                }
                Spacer()
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonText: "Change Day Time", textColor: .blue, backgroungColor: .white)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .bold, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding(.top)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
