//
//  StoryListViewModel.swift
//  SwiftUI HackerNews With Combine
//
//  Created by Varol Aksoy on 22.01.2022.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {
    
    @Published var stories = [StoryViewModel]()
    private var cancellable: AnyCancellable?
    
    init() {
        fetchTopStories()
    }
    
    private func fetchTopStories() {
        self.cancellable = WebService().getAllTopStories().map { stories in
            stories.map { StoryViewModel(story: $0)}
        }.sink(receiveCompletion: { _ in }, receiveValue: { storyViewModels in
            self.stories = storyViewModels
        })
    }
}

struct StoryViewModel {
    let story: Story
    var id: Int {
        story.id
    }
    
    var title: String {
        story.title
    }
    
    var url: String {
        story.url
    }
}
