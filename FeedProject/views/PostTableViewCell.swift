//
//  PostTableViewCell.swift
//  FeedProject
//
//  Created by Juanelo on 7/10/19.
//  Copyright © 2019 Juanelo. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titlePost: UILabel!
    @IBOutlet weak var datePost: UILabel!
    
    @IBOutlet weak var descriptionPost: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
