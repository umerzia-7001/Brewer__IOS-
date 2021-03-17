//
//  OrderListView.swift
//  Brewer
//
//  Created by Apple on 07/03/2021.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [orderViewModel]
    
    init(orders:[orderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        
       
            
        List() {
            
            ForEach(self.orders, id: \.id) { order in
                    HStack{
                        Image(order.coffeeName)
                            .resizable()
                            .frame(width: 100, height: 110, alignment: .leading)
                            .clipShape(Circle())
                        VStack{
                            Text("\(order.name)")
                                .font(.title)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                            HStack {
                                Text(order.coffeeName)
                                 .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .background(Color.gray)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10)
                                
                                Text(order.size)
                                  .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10)
                            }
                            
                        }
                    }
            }

        }
        
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [orderViewModel(order: Order(name: "Umer", size: "Regular", coffeeName: "Cappuccino", total: 5))])
    }
}
