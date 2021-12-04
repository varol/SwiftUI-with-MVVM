//
//  CounterVM.swift
//  HelloMVVMWithSwiftUI
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

class CounterVM: ObservableObject {
     
    @Published private var counter: Counter = Counter()
    
    var value: Int {
        counter.value
    }
    
    var premium: Bool {
        counter.isPremium
    }
    
    func increment() {
        counter.increment()
    }
}
