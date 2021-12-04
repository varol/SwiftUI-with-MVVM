//
//  FailedView.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

extension FailedView {
    fileprivate enum Constants {
        static let noResultTitle: String = "nE data mı yok? bakiim"
        static let noResultImage: String = "noResult"

    }
}

struct FailedView: View {
    var body: some View {
        VStack {
            Text(Constants.noResultTitle)
                .font(.largeTitle)
                .padding(.top, 16)
            Spacer()
            Image(Constants.noResultImage)
                .aspectRatio(contentMode: .fill)
            Spacer()
        }.contentShape(Rectangle())
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
