//
//  URL+Extensions.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import Foundation

extension URL {
    
    static func forMoviesByImdbID(_ imdbID: String) -> URL? {
        URL(string: "https://www.omdbapi.com/?i=\(imdbID)&apikey=\(Constants.API_KEY)")
    }

    static func forMoviesByName(_ name: String) -> URL? {
        URL(string: "https://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
}
