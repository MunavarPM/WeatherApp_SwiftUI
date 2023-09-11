//
//  WeatherRow.swift
//  WeatherApp_SwiftUi
//
//  Created by MUNAVAR PM on 07/09/23.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .foregroundColor(.white)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color("BG"))
                .cornerRadius(50)

            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "FeelsLike", value: "12")
    }
}
