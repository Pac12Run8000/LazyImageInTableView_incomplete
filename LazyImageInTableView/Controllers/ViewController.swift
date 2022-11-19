//
//  ViewController.swift
//  LazyImageInTableView
//
//  Created by Michelle Grover on 11/18/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var restaurantList:[Restaurants] = [] {
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
        
        NetworkingService.shared.fetchData { list in
            self.restaurantList = list
        }
        
        
    }


}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = restaurantList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell
        cell?.nameLabel.text = item.name
        cell?.addressLabel.text = item.address
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    
    
}

