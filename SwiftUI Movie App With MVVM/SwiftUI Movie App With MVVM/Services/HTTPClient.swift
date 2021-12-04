//
//  HTTPClient.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HTTPClient {
    
    func getMovieDetailsBy(imdbID: String,
                           completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        
        guard let url = URL.forMoviesByImdbID(imdbID) else {
            return completion(.failure(.badURL))
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.decodingError))
            }

            completion(.success(movieDetail))

        }.resume()
    }
    
    
    func getMoviesBy(search: String,
                     completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            if moviesResponse.error != nil {
                return completion(.failure(.noData))
            } else {
                completion(.success(moviesResponse.movies))
            }
            
        }.resume()
    }
}
