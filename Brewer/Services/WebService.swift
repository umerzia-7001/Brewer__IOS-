//
//  WebService.swift
//  Brewer
//
//  Created by Apple on 07/03/2021.
//

import Foundation

class WebService {
    
    /// creating new order
    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> ()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("Invalid URL")
        }
        var request  = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
                 completion(createOrderResponse)
            }
           
            
        }.resume()
    }
    

    func getAllOrders(completion: @escaping ([Order]?) -> ()) {
        
        /// URL for the server
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("Invalid URL")
        }
        /// fetching data from URL
        URLSession.shared.dataTask(with: url) { data, request, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let order  = try? JSONDecoder().decode([Order?].self, from: data)
            DispatchQueue.main.async {
                completion(nil)
            }
            return
            
            
        }.resume()

    }
    
    
    
}
