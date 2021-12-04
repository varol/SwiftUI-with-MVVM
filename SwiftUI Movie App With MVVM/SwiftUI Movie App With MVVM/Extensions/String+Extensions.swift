//
//  String+Extensions.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import Foundation

extension String {
    func trimmedAndEscaped() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
