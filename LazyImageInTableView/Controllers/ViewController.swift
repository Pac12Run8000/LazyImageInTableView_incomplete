//
//  ViewController.swift
//  LazyImageInTableView
//
//  Created by Michelle Grover on 11/18/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.fetchData { movies in
            for item in movies.results {
                print("********")
                print("name:",item.title)
                print("bd:", item.backdropPath.tmdbImagePath)
                print("pp:", item.backdropPath.tmdbImagePath)
                print("********")
            }
        }
    }


}

