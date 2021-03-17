//
//  OrdderListViewModel.swift
//  Brewer
//
//  Created by Apple on 07/03/2021.
//

import Foundation

class orderListViewModel: ObservableObject{
    
    /// mltiple orders
    @Published var orders = [orderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        
        WebService().getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map(orderViewModel.init)
            }
            
        }
        
    }
    
}

/// single order details
class orderViewModel {
    
    var order : Order
    
    let id = UUID()
    init(order: Order) {
        self.order = order
    }
    var name: String {
        return self.order.name
    }
    
    var size: String {
        return self.order.size
    }
    
    var coffeeName: String {
        return self.order.coffeeName
    }
    var total: Double {
        return self.order.total
    }
}
