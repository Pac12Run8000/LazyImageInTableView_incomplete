//
//  CustomImageView.swift
//  LazyImageInTableView
//
//  Created by Michelle Grover on 11/18/22.
//

import UIKit

var imgCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var task:URLSessionDataTask?
    var spinner = UIActivityIndicatorView(style: .medium)

    func loadImage(urlStr:String) {
        guard let url = URL(string: urlStr) else {return}
        DispatchQueue.main.async {
            self.image = nil
            self.addSpinner()
            if let task = self.task {
                task.cancel()
            }
            
            if let imageFromCache = imgCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
                self.image = imageFromCache
                self.spinner.removeFromSuperview()
                return
            }
            
            self.task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, let newImage = UIImage(data: data) else {
                    print("error:")
                    return
                }
                imgCache.setObject(newImage, forKey: url.absoluteString as AnyObject)

                DispatchQueue.main.async {
                    self.image = newImage
                    self.spinner.removeFromSuperview()
                }

            }
            self.task!.resume()
        }
    }
    
    
    
    func addSpinner() {
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = true
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.startAnimating()
    }

}
