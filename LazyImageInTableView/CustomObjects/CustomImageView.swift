//
//  CustomImageView.swift
//  LazyImageInTableView
//
//  Created by Michelle Grover on 11/18/22.
//

import UIKit

class CustomImageView: UIImageView {
    private let imageCache = NSCache<AnyObject, UIImage>()
   
    func loadImage(urlStr:String) {
        DispatchQueue.main.async {
            self.image = nil
            self.image = UIImage(systemName: "menubar.dock.rectangle.badge.record")
            guard let url = URL(string: urlStr) else {fatalError("No url")}
            
            if let cachedImage = self.imageCache.object(forKey: url.absoluteURL as AnyObject) {
                print("Images loaded from cache")
                self.image = cachedImage
                return
            }
            
            DispatchQueue.global(qos: .userInteractive).async {
                guard let data = try? Data(contentsOf: url) else {fatalError("No data")}
                guard let image = UIImage(data: data) else {fatalError("No image")}
                guard let resizedImage = image.resizeImageTo(size: CGSize(width: 80.00, height: 80.00)) else {fatalError("Couldn't resize image")}
                    print("Images loaded from internet")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.imageCache.setObject(resizedImage, forKey: url.absoluteURL as AnyObject)
                        self.image = resizedImage
                }
            }
        }
    }
    
    
    


}
