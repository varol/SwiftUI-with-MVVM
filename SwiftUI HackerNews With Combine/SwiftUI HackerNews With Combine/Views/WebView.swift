//
//  WebView.swift
//  SwiftUI HackerNews With Combine
//
//  Created by Varol Aksoy on 22.01.2022.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
           return WKWebView.pageNotFoundView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        guard let url = URL(string: url) else {
            return
        }
                let request = URLRequest(url: url)
        uiView.load(request)
    }

}
