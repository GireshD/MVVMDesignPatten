//
//  ArticleTVCell.swift
//  MVVMDemo
//
//  Created by Giresh Dora on 23/07/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import UIKit

class ArticleTVCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
