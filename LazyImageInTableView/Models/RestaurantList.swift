//
//  RestaurantList.swift
//  LazyImageInTableView
//
//  Created by Michelle Grover on 11/18/22.
//

import Foundation

// MARK: - WelcomeElement
struct Restaurants: Codable {
    let name, address, price: String
    let imageURLString: String

    enum CodingKeys: String, CodingKey {
        case name, address, price
        case imageURLString = "imageUrlString"
    }
}

typealias RestaurantList = [Restaurants]
