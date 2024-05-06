//
//  APIService.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

enum TestError: Error {
    case invalid
}

final class APIService {
    
    func fetchEvents() async throws -> TMEvents {
        return try await request(endpoint: .fetchEvents, responseModel: TMEvents.self)
    }
    
    func request<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.parameters
        
        guard let url = urlComponents.url else { throw TestError.invalid }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw TestError.invalid }
        
        guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else { throw TestError.invalid }
        print(decodedResponse)
        return decodedResponse
    }
}
