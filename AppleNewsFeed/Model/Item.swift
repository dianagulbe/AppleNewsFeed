//
//  Item.swift
//  AppleNewsFeed
//
//  Created by diana.gulbe on 10/08/2021.
//

import UIKit
import Gloss

class Item: JSONDecodable {
    
    var description: String
    var title: String
    var url: String
    var urlToImage: String
    var image: UIImage?
    var publishedAt: String
    
    
    required init?(json: JSON) {
        self.description = "description" <~~ json ?? ""
        self.title = "title" <~~ json ?? ""
        self.url = "url" <~~ json ?? ""
        self.urlToImage = "urlToImage" <~~ json ?? ""
        self.publishedAt = "publishedAt" <~~ json ?? ""
        
        DispatchQueue.main.async {
            self.image = self.laodImage()
        }
        
    }
    
    private func laodImage() -> UIImage? {
        var returnImage: UIImage?
        
        guard let url = URL(string: urlToImage) else {
            return returnImage
        }
        
        if let data = try? Data(contentsOf: url){
            if let image = UIImage(data: data){
                returnImage = image
            }
        }
        return returnImage
    }

}
