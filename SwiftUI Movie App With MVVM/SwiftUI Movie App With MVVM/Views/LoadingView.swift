//
//  LoadingView.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

extension LoadingView {
    fileprivate enum Constants {
        static let loadingText: String = "Loading..."
    }
}

struct LoadingView: View {
    var body: some View {
        VStack {
            Text(Constants.loadingText)
                .font(.headline)
                .padding(.top, 16)
            Spacer()
        }.contentShape(Rectangle())
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
