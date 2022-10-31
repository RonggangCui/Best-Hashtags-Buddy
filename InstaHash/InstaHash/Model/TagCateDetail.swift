//
//  TagCate.swift
//  InstaHash
//
//  Created by Alex Cui on 2021-01-02.
//

import Foundation
import UIKit

class TagCateDetail {
    
    var image: UIImage
    var title: String
    var category: Category
    
    init(image: UIImage, title: String, category: Category) {
        self.image = image
        self.title = title
        self.category = category
        
    }
    
}
