//
//  EmptyView.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack{
            Text("Start searching for your new favorite movies")
            Spacer()
        }.contentShape(Rectangle())
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
