//
//  GeoCodingClient.swift
//  Weatherly
//
//  Created by Anup Saud on 2024-07-09.
//

import Foundation
enum NetworkError: Error{
    case invalidResponse
}
struct GeoCodingClient{
    func coordinateByCity(city:String) async throws -> Location?{
       let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endPointURL(for: .coordinatesByLocationName(city)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else{
            throw NetworkError.invalidResponse  
        }
        let location = try JSONDecoder().decode([Location].self, from: data)
        return location.first
        
    }

}
