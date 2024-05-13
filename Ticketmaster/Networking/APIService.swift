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
    
    func fetchAttractions(page: Int, sort: String) async throws -> TMAttractionsContainer {
        return try await request(endpoint: .fetchAttractions(page: page, sortOption: sort), responseModel: TMAttractionsContainer.self)
    }
    
    func fetchVenues(page: Int, countryCode: String, sort: String) async throws -> TMVenuesContainer {
        return try await request(endpoint: .fetchVenues(page: page, countryCode: countryCode, sortOption: sort), responseModel: TMVenuesContainer.self)
    }
    
    func fetchEvents(page: Int, countryCode: String, sort: String) async throws -> TMEventsContainer {
        return try await request(endpoint: .fetchEvents(page: page, countryCode: countryCode, sortOption: sort), responseModel: TMEventsContainer.self)
    }
    
    func fetchClassifications() async throws -> TMSectionsContainer {
        return try await request(endpoint: .fetchClassifications, responseModel: TMSectionsContainer.self)
    }
    
    func request<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.parameters
        guard let url = urlComponents.url else { throw TestError.invalidURL }
        
//        var request = URLRequest(url: url)
//        request.httpMethod = endpoint.method
//        
//        let (data, response) = try await URLSession.shared.data(for: request)
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw TestError.invalidResponse }
//        guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else { throw TestError.invalidDecoding }
//        return decodedResponse
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        
        print(url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw TestError.invalidResponse }
        
        
//        do {
//            let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
//            return decodedResponse
        
//        } catch DecodingError.keyNotFound(let key, let context) {
//            Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
//        } catch DecodingError.valueNotFound(let type, let context) {
//            Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
//        } catch DecodingError.typeMismatch(let type, let context) {
//            Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
//        } catch DecodingError.dataCorrupted(let context) {
//            Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
//        } catch let error as NSError {
//            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
//        }
//
//
        do {
            let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
            return decodedResponse
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        
        
        
        return [] as! T
    }
}


//var request = URLRequest(url: url)
//request.httpMethod = endpoint.method
//
//print(url)
//
//let (data, response) = try await URLSession.shared.data(for: request)
//guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw TestError.invalidResponse }
//
//
//do {
//    let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
//    return decodedResponse
//    
//} catch DecodingError.keyNotFound(let key, let context) {
//    Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
//} catch DecodingError.valueNotFound(let type, let context) {
//    Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
//} catch DecodingError.typeMismatch(let type, let context) {
//    Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
//} catch DecodingError.dataCorrupted(let context) {
//    Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
//} catch let error as NSError {
//    NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
//}
//
//return [] as! T
//
////        guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else { throw TestError.invalidDecoding }
