//
//  LazyImageView.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 30/07/22.
//

import Foundation
import UIKit

class LazyImageView : UIImageView {
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    func loadImage(imageURL: URL, placeHolderImage: String){
        self.image = UIImage(named: placeHolderImage)
        
        if let cachedImage = imageCache.object(forKey: imageURL as AnyObject) {
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self.image = image
                    }
                }
            }
        }
        
    }
}
