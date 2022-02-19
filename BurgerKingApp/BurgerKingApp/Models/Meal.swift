//
//  Meal.swift
//  BurgerKingApp
//
//  Created by Dmitry on 17.02.22.
//

import Foundation
import UIKit

struct Meal {
    let name: String
    let price: Double
    let image: UIImage?
    
    var feedbacks: [Feedback] = []
    
    var ratingBar: String {
        
        if let raiting = raiting {
            return String(repeating: "⭐️", count: raiting)
        } else {
            return "There are no reviews yet"
        }
    }
    
    private var raiting: Int? {
        if feedbacks.isEmpty {
            return nil
        } else {
            var sum = 0
            for review in feedbacks {
                sum += review.mark
            }
            
            return sum / feedbacks.count
        }
    }
}
