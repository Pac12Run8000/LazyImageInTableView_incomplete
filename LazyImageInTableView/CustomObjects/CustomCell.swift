//
//  CustomCell.swift
//  LazyImageInTableView
//
//  Created by Michelle Grover on 11/18/22.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var customImageView: CustomImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var addressLabel:UILabel!
    
    var restaurant:Restaurant? {
        didSet {
            nameLabel.text = restaurant?.name
            addressLabel.text = restaurant?.address
            customImageView.loadImage(urlStr: restaurant!.imageURLString)
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        customImageView.layer.masksToBounds = true
        customImageView.layer.cornerRadius = 7
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
