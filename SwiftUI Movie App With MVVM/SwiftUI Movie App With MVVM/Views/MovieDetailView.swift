//
//  MovieDetailView.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

struct MovieDetailView: View {
    let movieDetailVM: MovieDetailVM
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: movieDetailVM.poster)
                    .cornerRadius(10)
                
                Text(movieDetailVM.title)
                    .font(.title)
                
                Text(movieDetailVM.plot)
                Text("Director").fontWeight(.bold)
                Text(movieDetailVM.director)
                HStack {
                    Rating(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }.padding(.top, 10)
                
                Spacer()
            }.padding()
            
                .navigationTitle(self.movieDetailVM.title)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movieDetail =  MovieDetail(title: "Dummy", year: "1987", rated: "PG-13", director: "Varol Aksoy", actors: "", plot: "Varol Aksoy", poster: "http://4.bp.blogspot.com/-Gn91y06Wejk/VeYnn5TVu3I/AAAAAAAAE1E/-HOKuLUvZDA/s1600/TOSUN_PASA_1976.jpg", imdbRating: "8.7", imdbID: "345fgD")
                                        
        return MovieDetailView(movieDetailVM: MovieDetailVM(movieDetail: movieDetail))
                                            .embedNavigationView()
    }
}
