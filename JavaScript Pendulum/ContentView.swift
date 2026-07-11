//
//  ContentView.swift
//  JavaScript
//
//  Created by Larry on 2025-09-22.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var page = WebPage()

    var body: some View {
        VStack {
            Text(page.title)
            WebView(page)
        }
        .onAppear {
            guard let url = URL(string: "http://127.0.0.1:8080") else { return }
            var request = URLRequest(url: url)
            // Instruct WebKit to completely ignore local cache items
            request.cachePolicy = .reloadIgnoringLocalCacheData
            page.load(request)
        }
    }
}
