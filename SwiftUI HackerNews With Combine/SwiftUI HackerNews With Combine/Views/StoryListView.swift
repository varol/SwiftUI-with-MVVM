//
//  StoryListView.swift
//  SwiftUI HackerNews With Combine
//
//  Created by Varol Aksoy on 22.01.2022.
//

import SwiftUI

struct StoryListView: View {
    @ObservedObject private var storyListVM = StoryListViewModel()
    
    var body: some View {
        NavigationView {
            List(self.storyListVM.stories, id: \.id) { storyVM in
                Text("\(storyVM.id)")
            }
            .navigationTitle("Hacker News")
        }
        .navigationViewStyle(.stack)
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
