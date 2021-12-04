//
//  MovieDetailVM.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import Foundation

class MovieDetailVM: BaseVM {
    
    private var movieDetail: MovieDetail?
    private var httpClient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    

    func getDetailsByImdbID(imdbID: String) {
        self.loadingState = .loading
        httpClient.getMovieDetailsBy(imdbID: imdbID) { result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.movieDetail = details
                    self.loadingState = .success
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }

    var plot: String {
        self.movieDetail?.plot ?? ""
    }

    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String {
        self.movieDetail?.director ?? ""
    }
}
