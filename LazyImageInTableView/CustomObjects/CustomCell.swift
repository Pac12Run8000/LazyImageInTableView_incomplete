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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
