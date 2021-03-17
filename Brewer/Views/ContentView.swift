//
//  ContentView.swift
//  Brewer
//
//  Created by Apple on 07/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = orderListViewModel()
    
    @State private var showModal: Bool = false
    
    var body: some View {
        
        NavigationView {
        
        OrderListView(orders: self.orderListVM.orders)
            
            
         
            .navigationBarTitle("Coffee Orders")
            .navigationBarItems(leading: Button(action: reloadOrders) {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(Color.white)
                }, trailing: Button(action: showAddCoffeeOrderView){
                    Image(systemName: "plus")
                        .foregroundColor(Color.white)
            })
          
            
        }
    }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
