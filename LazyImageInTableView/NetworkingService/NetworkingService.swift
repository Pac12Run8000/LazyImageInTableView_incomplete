//
//  NetworkingService.swift
//  LazyImageInTableView
//
//  Created by Michelle Grover on 11/18/22.
//

import Foundation

final class NetworkingService {
    public static let shared = NetworkingService()
    private init() {}
    
    private let apiString:String = ""
    public func fetchData(urlString:String, completion:@escaping(Data) -> ()) {
        guard let url = URL(string: urlString) else {
            fatalError("There is no Url")
        }
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            guard error == nil else {
                fatalError("There was an error:\(String(describing: error?.localizedDescription))")
            }
            guard let data = data else {
                fatalError("No data")
            }
            completion(data)
        }
        task.resume()
    }
}


