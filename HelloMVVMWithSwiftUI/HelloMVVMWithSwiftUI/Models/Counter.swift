//
//  Counter.swift
//  HelloMVVMWithSwiftUI
//
//  Created by Varol Aksoy on 4.12.2021.
//

import Foundation

struct Counter {
    
    var value: Int  = .zero
    var isPremium: Bool = false
    
    mutating func increment() {
        value += 1
        
        isPremium = value.isMultiple(of: 3) ? true : false
    }
}
