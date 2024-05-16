//
//  APIService.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

enum TestError: Error {
    case invalidURL
    case invalidResponse
    case invalidDecoding
}

final class APIService {
    func fetchEvents(
        page: Int,
        countryCode: String?,
        sort: String = TMEventSortingOption.relevance.rawValue,
        segmentID: String?,
        genreID: String?,
        search: String?
    ) async throws -> TMEventsContainer {
        return try await request(
            endpoint: .fetchEvents(
                page: page,
                countryCode: countryCode,
                sortOption: sort,
                segmentID: segmentID,
                genreID: genreID,
                search: search
            ),
            responseModel: TMEventsContainer.self
        )
    }
    
    func fetchAttractions(
        page: Int,
        sort: String,
        genreID: String?,
        search: String?
    ) async throws -> TMAttractionsContainer {
        return try await request(
            endpoint: .fetchAttractions(
                page: page,
                sortOption: sort,
                genreID: genreID,
                search: search
            ),
            responseModel: TMAttractionsContainer.self
        )
    }
    
    func fetchVenues(
        page: Int,
        countryCode: String,
        sort: String,
        genreID: String?,
        search: String?
    ) async throws -> TMVenuesContainer {
        return try await request(
            endpoint: .fetchVenues(
                page: page,
                countryCode: countryCode,
                sortOption: sort,
                genreID: genreID,
                search: search
            ),
            responseModel: TMVenuesContainer.self
        )
    }
    
    func fetchClassifications(
    ) async throws -> TMSectionsContainer {
        return try await request(
            endpoint: .fetchClassifications,
            responseModel: TMSectionsContainer.self
        )
    }
    
    func request<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.parameters
        guard let url = urlComponents.url else { throw TestError.invalidURL }
        
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw TestError.invalidResponse }
        guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else { throw TestError.invalidDecoding }
        return decodedResponse
    }
}
