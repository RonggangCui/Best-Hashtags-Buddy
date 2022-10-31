//
//  Category.swift
//  InstaHash
//
//  Created by Alex Cui on 2021-01-05.
//

import Foundation

struct Category: Codable {
    var categoryName: String
    var subCate: [String]
    var subCateTags: [[String]]
}


