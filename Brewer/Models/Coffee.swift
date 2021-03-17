//
//  Coffee.swift
//  Brewer
//
//  Created by Apple on 07/03/2021.
//

import Foundation

struct Coffee {
    
    let name: String
    let imageURL: String
    let price: Double
    
}

extension Coffee {
    
    static func all() -> [Coffee] {
        return [
                   Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
                   Coffee(name: "Expresso", imageURL: "Expresso", price: 2.1),
                   Coffee(name: "Regular", imageURL: "Regular", price: 1.0)
               ]
    }
    
}

