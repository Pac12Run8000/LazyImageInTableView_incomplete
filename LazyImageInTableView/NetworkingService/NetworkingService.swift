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
    public func fetchData(completion:@escaping(RestaurantList) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            let data:Data = HelperConstants.data
            let parser = JSonParser<RestaurantList>()
            parser.parseData(data: data) { list in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    completion(list)
                }
            }
           
        }
        
    }
}


