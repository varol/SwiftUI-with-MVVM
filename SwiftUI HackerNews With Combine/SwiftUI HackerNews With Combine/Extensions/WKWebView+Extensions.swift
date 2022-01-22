//
//  WKWebView+Extensions.swift
//  SwiftUI HackerNews With Combine
//
//  Created by Varol Aksoy on 22.01.2022.
//

import WebKit

extension WKWebView {
    static func pageNotFoundView() -> WKWebView {
        
        let wk = WKWebView()
        wk.loadHTMLString("", baseURL: nil)
        return wk
    }
}
