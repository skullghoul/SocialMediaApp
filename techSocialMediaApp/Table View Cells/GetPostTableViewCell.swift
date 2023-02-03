//
//  GetPostTableViewCell.swift
//  techSocialMediaApp
//
//  Created by Zander Ewell on 2/2/23.
//

import UIKit

class GetPostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var authorUserLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
