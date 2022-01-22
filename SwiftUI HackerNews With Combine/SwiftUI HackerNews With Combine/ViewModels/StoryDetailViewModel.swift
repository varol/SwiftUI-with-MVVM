//
//  StoryDetailViewModel.swift
//  SwiftUI HackerNews With Combine
//
//  Created by Varol Aksoy on 22.01.2022.
//

import Foundation

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {
    
    var storyId: Int
    private var cancellable: AnyCancellable?
    @Published private var story: Story?

    init(storyId: Int) {
        self.storyId = storyId
        
        fetchStoryById(storyId)
    }
    
    private func fetchStoryById(_ storyId: Int) {
        self.cancellable = WebService().getStoryById(storyId: storyId)
            .sink(receiveCompletion: { _ in }, receiveValue: { story in
                self.story = story
            })
    }
}

extension StoryDetailViewModel {
    var title: String? {
        story?.title
    }
    
    var url: String? {
        story?.url
    }
}
