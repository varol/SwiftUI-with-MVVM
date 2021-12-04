//
//  MovieDetailScreen.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

struct MovieDetailScreen: View {
    let imdbID: String
    @ObservedObject var movieDetailVM = MovieDetailVM()
    
    var body: some View {
        VStack {
            switch movieDetailVM.loadingState {
            case .success:
                MovieDetailView(movieDetailVM: movieDetailVM)
            case . failed:
                FailedView()
            case .loading:
                LoadingView()
            case .none:
                EmptyView()
            }
        }
        
        .onAppear {
            self.movieDetailVM.getDetailsByImdbID(imdbID: imdbID)
        }

    }
}
