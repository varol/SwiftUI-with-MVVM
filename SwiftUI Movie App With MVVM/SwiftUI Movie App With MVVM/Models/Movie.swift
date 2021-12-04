//
//  Movie.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import Foundation

// MARK: - MoviesResponse
struct MovieResponse: Codable {
    let movies: [Movie]?
    let totalResults, response, error: String?

    enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case totalResults
        case response = "Response"
        case error = "Error"
    }
}

// MARK: - Search
struct Movie: Codable {
    let title, year, imdbID: String?
    let type: String?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
