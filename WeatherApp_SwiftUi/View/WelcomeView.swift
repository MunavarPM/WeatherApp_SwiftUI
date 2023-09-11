//
//  WelcomeView.swift
//  WeatherApp_SwiftUi
//
//  Created by MUNAVAR PM on 06/09/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var viewModel: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Image("onBoarding 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200)
                    .cornerRadius(40)
                    .shadow(radius: 20)
                Text("Welcome to Weather App")
                    .bold().font(.title)
                    .foregroundColor(.white)
                Text("Please share your current Location to get the weather of that Area")
                    .padding()
                    .foregroundColor(.white)
            }
            LocationButton(.shareCurrentLocation) {
                withAnimation(.easeIn) {
                    viewModel.requestLocation()
                }
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
