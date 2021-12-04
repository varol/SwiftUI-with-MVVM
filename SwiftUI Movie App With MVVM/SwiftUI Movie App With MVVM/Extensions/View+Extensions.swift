//
//  View+Extensions.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        NavigationView { self }
    }
}
