//
//  Orders.swift
//  Brewer
//
//  Created by Apple on 07/03/2021.
//

import Foundation

struct Order: Codable {
    
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
    
}
