//
//  MovieListView.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

struct MovieListView: View {
    
    let movies: [MovieVM]
    
    var body: some View {
        List(self.movies, id: \.imdbID) { movie in
            NavigationLink(destination: MovieDetailScreen(imdbID: movie.imdbID)) {
                MovieCell(movie: movie)
            }
        }
    }
}

struct MovieCell: View {
    let movie: MovieVM
    
    var body: some View {
        HStack(alignment: .top) {
            
            if let poster = movie.poster {
                URLImage(url: poster)
                    .frame(width: 100, height: 120, alignment: .center)
                    .cornerRadius(6)
            }
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)

                HStack {
                    Text(movie.year)
                        .opacity(0.5)

                    Text(movie.type)
                        .opacity(0.5)
                }
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}
