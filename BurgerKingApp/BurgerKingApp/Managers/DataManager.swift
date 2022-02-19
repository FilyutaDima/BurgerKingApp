//
//  DataManager.swift
//  BurgerKingApp
//
//  Created by Dmitry on 17.02.22.
//

import Foundation

class DataManager {
    
    private init() {
        
        meals = [Meal(name: "КАРТОФЕЛЬ ДЕРЕВЕНСКИЙ", price: 3.8, image: #imageLiteral(resourceName: "kartofel_derevenskii.jpeg")),
                     Meal(name: "МОЦАРЕЛЛА ЧИКЕН РОЛЛ", price: 7.5, image: #imageLiteral(resourceName: "motsarella_chiken_roll.jpeg")),
                     Meal(name: "КИНГ БУКЕТ БОЛЬШОЙ МИКС", price: 14.5, image: #imageLiteral(resourceName: "king_buket_bolshoi_miks.jpeg"))]
        
    }
    
    static let shared = DataManager()
    var meals: [Meal]
    
}
