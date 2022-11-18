//
//  JSonParser.swift
//  LazyImageInTableView
//
//  Created by Michelle Grover on 11/18/22.
//

import Foundation


struct JSonParser<T:Decodable> {
    
    public func parseData(data:Data, completion:@escaping(T) -> ()) {
        var output:T?
        do {
            output = try JSONDecoder().decode(T.self, from: data)
            completion(output!)
        } catch {
            fatalError("Model doesn't match the data")
        }
    }
    

    
}
