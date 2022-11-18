//
//  ViewController.swift
//  LazyImageInTableView
//
//  Created by Michelle Grover on 11/18/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tblViewArray:[Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        NetworkingService.shared.fetchData { movies in
            for item in movies.results {
                self.tblViewArray.append(Movie(name: item.title, bd: item.backdropPath.tmdbImagePath, pp: item.posterPath.tmdbImagePath))
            }
        }
    }


}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tblViewArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = item.name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tblViewArray.count
    }
    
    
    
}

