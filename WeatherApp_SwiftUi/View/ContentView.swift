//
//  ContentView.swift
//  WeatherApp_SwiftUi
//
//  Created by MUNAVAR PM on 04/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LocationManager()
    @State var location = ""
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $location)
                    .padding(.leading, 30)
                    .frame(width: 200, height: 40)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        Task {
                            do {
                                weather = try await viewModel.getCurrentWeather(location: location)
                            } catch {
                                print("Error\(error)")
                            }
                        }
                    }
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    .padding(.trailing)
            }
            .background(Color("SBG"))
            .clipShape(Capsule())
            
            if let location = viewModel.location {
                if let weather = weather {
                    WeatherView(city: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await viewModel.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error\(error)")
                        }
                    }
                }
            } else {
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(viewModel)
                }
            }
        }
        .background(Image("Image1.5x"))
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
