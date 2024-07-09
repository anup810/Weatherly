//
//  Weather.swift
//  Weatherly
//
//  Created by Anup Saud on 2024-07-09.
//

import Foundation

struct WeatherResponse: Decodable{
    let main: Weather
    // let weather: [Weather]
}

struct Weather: Decodable{
    let temp: Double
}

/*struct Weather:Decodable{
    let description: String
    
}
*/
