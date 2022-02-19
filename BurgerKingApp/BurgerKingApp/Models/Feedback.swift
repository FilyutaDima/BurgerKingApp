//
//  File.swift
//  BurgerKingApp
//
//  Created by Dmitry on 17.02.22.
//

import Foundation

struct Feedback {
    let text: String
    private let date = Date()
    let mark: Int
    
    var ratingBar: String {
        String(repeating: "⭐️", count: mark)
    }
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date)
    }
}
