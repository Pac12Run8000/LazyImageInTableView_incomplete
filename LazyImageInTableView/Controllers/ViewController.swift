//
//  ViewController.swift
//  LazyImageInTableView
//
//  Created by Michelle Grover on 11/18/22.
//

import UIKit

class ViewController: UIViewController {
    
    var tblViewArray:[Movie] = [] {
        didSet {
            print(tblViewArray)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.fetchData { movies in
            for item in movies.results {
                self.tblViewArray.append(Movie(name: item.title, bd: item.backdropPath.tmdbImagePath, pp: item.posterPath.tmdbImagePath))
            }
        }
    }


}

