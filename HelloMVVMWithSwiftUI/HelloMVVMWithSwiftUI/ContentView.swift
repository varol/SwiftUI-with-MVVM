//
//  ContentView.swift
//  HelloMVVMWithSwiftUI
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

extension ContentView {
    fileprivate enum Constants {
        static let premiumTitle: String = "Premium"
        static let buttonTitle: String = "Increment"
    }
}

struct ContentView: View {
    
    @ObservedObject private var counterVM: CounterVM
    
    init() {
        counterVM = CounterVM()
    }
    
    var body: some View {
        VStack {
            Text(counterVM.premium ? Constants.premiumTitle : "")
                .frame(width: 200, height: 200)
                .font(.largeTitle)
                .foregroundColor(.green)
            
            Text("\(counterVM.value)")
                .font(.title)
            
            Button(Constants.buttonTitle) {
                self.counterVM.increment()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
