//
//  BaseVM.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import Foundation

enum LoadingState {
    case loading
    case success
    case failed
    case none
}

class BaseVM: ObservableObject { // ObservableObject struct ile kullanilamaz, sadece class conform edebilir
    @Published var loadingState: LoadingState = .none
}
