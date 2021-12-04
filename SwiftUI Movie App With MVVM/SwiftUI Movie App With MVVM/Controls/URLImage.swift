//
//  URLImage.swift
//  SwiftUI Movie App With MVVM
//
//  Created by Varol Aksoy on 4.12.2021.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
      
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image("placeholder").resizable()
        }
        
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "http://4.bp.blogspot.com/-Gn91y06Wejk/VeYnn5TVu3I/AAAAAAAAE1E/-HOKuLUvZDA/s1600/TOSUN_PASA_1976.jpg")
    }
}
