//
//  ReviewService.swift
//  InstaHash
//
//  Created by Alex Cui on 2021-01-08.
//

import Foundation
import StoreKit


class ReviewService {
    
    private init() {}
    
    static let shared = ReviewService()
    
    func requestReview()  {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
    
    
    
    
}
