//
//  HashTagCell.swift
//  InstaHash
//
//  Created by Alex Cui on 2021-01-02.
//

import UIKit

class HashTagCell: UITableViewCell {

    
    @IBOutlet weak var CateImage: UIImageView!
    @IBOutlet weak var CateLabel: UILabel!
    
    
    func setCate(cate: TagCateDetail) {
        CateImage.image = cate.image
        CateLabel.text = cate.title
    }
    
}
