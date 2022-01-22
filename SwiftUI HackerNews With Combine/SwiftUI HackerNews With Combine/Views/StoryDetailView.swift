//
//  StoryDetailView.swift
//  SwiftUI HackerNews With Combine
//
//  Created by Varol Aksoy on 22.01.2022.
//

import SwiftUI

struct StoryDetailView: View {
    
    @ObservedObject private var storyDetailVM: StoryDetailViewModel
    var storyId: Int
    
    init(storyId: Int) {
        self.storyId = storyId
        self.storyDetailVM = StoryDetailViewModel()
    }
    
    var body: some View {
        VStack {
            Text(self.storyDetailVM.title ?? "")
            WebView(url: storyDetailVM.url)
        }.onAppear {
            self.storyDetailVM.fetchStoryById(storyId)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 0)
    }
}
