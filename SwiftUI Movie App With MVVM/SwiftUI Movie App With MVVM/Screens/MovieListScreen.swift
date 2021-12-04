//
//  MovieListScreen.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

extension MovieListScreen {
    fileprivate enum Constants {
        static let screenTitle: String = "Movies"
        static let textfieldPlaceholder: String = "Search"

    }
}

struct MovieListScreen: View {
    
    //ObservableObject ile karismasin, ObservableObject ile dinlenebilir bir obje olusturuyoruz, dinlenebilir objeyi kullanmak icin @ObservedObject wrapperini kullaniyoruz.
    @ObservedObject private var movieListVM: MovieListVM
    @State private var movieName: String = ""
    
    init() {
        self.movieListVM = MovieListVM()
    }
    
    var body: some View {
        VStack {
            
            TextField(Constants.textfieldPlaceholder, text: $movieName) { _ in
                self.movieListVM.searchByName(self.movieName)
            }
            .textFieldStyle(.roundedBorder)
            
            Spacer()
        
            .navigationBarTitle(Constants.screenTitle)

            switch movieListVM.loadingState {
            case .success:
                MovieListView(movies: movieListVM.movies)
            case . failed:
                FailedView()
            case .loading:
                LoadingView()
                    .padding(.top, 30)
            case .none:
                EmptyView()
                    .padding(.top, 30)
            }
            
        }.padding(10).embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
