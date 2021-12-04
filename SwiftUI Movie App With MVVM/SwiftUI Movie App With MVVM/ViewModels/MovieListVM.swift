//
//  MovieListVM.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

class MovieListVM: BaseVM {
    
    @Published var movies = [MovieVM]() // @Published, obje guncellendiginde haber verebilmek icin gerekli
    let httpClient = HTTPClient()
    
    func searchByName(_ name: String) {
        
        if name.isEmpty {
            return
        }
        
        self.loadingState = .loading
        httpClient.getMoviesBy(search: name.trimmedAndEscaped()) { result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieVM.init)
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
}

struct MovieVM {
    
    let movie: Movie
    
    var imdbID: String {
        movie.imdbID ?? ""
    }
    
    var title: String {
        movie.title ?? ""
    }

    var poster: String {
        movie.poster ?? ""
    }

    var year: String {
        movie.year ?? ""
    }

    var type: String {
        movie.type ?? ""
    }
}
