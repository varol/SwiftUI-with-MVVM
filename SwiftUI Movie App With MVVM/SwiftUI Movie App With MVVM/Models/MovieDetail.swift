//
//  MovieDetail.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import Foundation

// MARK: - MovieDetailResponse
struct MovieDetail: Codable {
    let title, year, rated: String?
    let director: String?
    let actors, plot: String?
    let poster: String?
    let imdbRating, imdbID: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case imdbRating,  imdbID
    }
}

