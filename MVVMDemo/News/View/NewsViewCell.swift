//
//  NewsViewCell.swift
//  News
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import UIKit
import moa

class NewsViewCell: UITableViewCell {
    
    @IBOutlet weak var newsHeadlineImageView: UIImageView!
    
    @IBOutlet weak var newsTtileLabel: UILabel!
    
    @IBOutlet weak var newsAuthorLabel: UILabel!
    
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with article : NewsCellViewModel) {
        newsHeadlineImageView.image = UIImage(named: "placeholder.jpg")
        newsHeadlineImageView.moa.url = article.getURL()
        newsTtileLabel.text = article.getTitle()
        newsAuthorLabel.text = article.getAuthor()
        newsDescriptionLabel.text = article.getDescriptionField()
    }
    
}
