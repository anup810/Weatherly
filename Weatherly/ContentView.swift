//
//  ContentView.swift
//  Weatherly
//
//  Created by Anup Saud on 2024-07-09.
//

import SwiftUI

struct ContentView: View {
    @State var city: String = ""
    @State var isFetchingWeather: Bool = false
    let geocodingClient = GeoCodingClient()
    let weatherClient = WeatherClient()
    @State var weather: Weather?
   private  func fetchWeather() async{
        do{
            guard let location = try await geocodingClient.coordinateByCity(city: city) else {return}
            weather = try await weatherClient.fetchWeather(location: location)
            
        }catch{
            print(error)
            
        }
    }
    

    var body: some View {
        VStack {
            TextField("City",text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetchingWeather = true
                }.task(id: isFetchingWeather) {
                    if isFetchingWeather{
                        await fetchWeather()
                        isFetchingWeather = false
                        city = ""
                    }
                }
            Spacer()
            if let weather{
                Text(MeasurementFormatter.temperature(value: weather.temp))
                    .font(.system(size: 100))
            }
            Spacer()

            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
