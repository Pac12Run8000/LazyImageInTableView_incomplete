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
    public func fetchData(completion:@escaping(CurrentMovies) -> ()) {
        guard let url = URL(string: Constants.currentMoviesURLString) else {
            fatalError("There is no Url")
        }
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            guard error == nil else {
                fatalError("There was an error:\(String(describing: error?.localizedDescription))")
            }
            guard let data = data else {
                fatalError("No data")
            }
            DispatchQueue.global(qos: .userInitiated).async {
                let parser = JSonParser<CurrentMovies>()
                parser.parseData(data: data) { movies in
                    completion(movies)
                }
            }
        }
        task.resume()
    }
}


struct Constants {
    static let currentMoviesURLString:String = "https://api.themoviedb.org/3/movie/now_playing?api_key=1aff0f2a2e051932796861db6a246d75&language=en-US&page=1"
    
}


extension String {
    var tmdbImagePath:String {
        return "https://image.tmdb.org/t/p/origina" + self
    }
}
