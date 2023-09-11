//
//  WeatherView.swift
//  WeatherApp_SwiftUi
//
//  Created by MUNAVAR PM on 06/09/23.
//

import SwiftUI

struct WeatherView: View {
    var city: ResponseBody
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 10) {
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    Text(city.name)
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                    Image("onBoarding 1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    HStack {
                        Text("Today's Weather")
                            .font(.system(size: 15))
                        Text(" \(city.main.temp.roundDouble())\("°")")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                    }
                }
                .frame(width: 300, height: 300)
                .padding()
                .background(Color("BG"))
                .cornerRadius(30)
                .padding(.top, 150)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (city.main.tempMin.roundDouble() + ("°")))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (city.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (city.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(city.main.humidity.roundDouble())%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
                }
            }
        .background(Image("Image1.5x"))
        .ignoresSafeArea(.all)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(city: previewWeather)
    }
}
