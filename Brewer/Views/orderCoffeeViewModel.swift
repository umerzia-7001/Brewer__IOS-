//
//  orderCoffeeViewModel.swift
//  Brewer
//
//  Created by Apple on 07/03/2021.
//

import SwiftUI

struct orderCoffeeViewModel: View {
    
    @Binding var isPresented: Bool
    @ObservedObject private var coffeeOrder = AddCoffeeOrderViewModel()
    
    
    var body: some View {
        
        NavigationView{
            
            Form {
                
                Section(header: Text("INFORMATION").font(.body)) {
                    TextField("Enter name", text: self.$coffeeOrder.name)
                }
                
                Section(header: Text("SELECT COFFEE").font(.body)) {
                    
                    ForEach(coffeeOrder.coffeeList, id:\.name) { coffee in
                        
                        CoffeeCellView(coffee: coffee, selection: self.$coffeeOrder.coffeeName)
                    }
                    
                }
                
                Section(header: Text("SELECT C OFFEE").font(.body), footer: OrderTotalView(total: self.coffeeOrder.total)) {
                    Picker("",selection: self.$coffeeOrder.size) {
                        Text("Small").tag("Small")
                                               Text("Medium").tag("Medium")
                                               Text("Large").tag("Large")
                    }.pickerStyle(SegmentedPickerStyle())
                }
                HStack {
                Button("Place Order") {
                    self.coffeeOrder.placeOrder()
                    self.isPresented = false
                }
                    
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(Color.white)
                .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                .cornerRadius(10)
                
            }        }
        
    }
}

struct orderCoffeeViewModel_Previews: PreviewProvider {
    static var previews: some View {
        orderCoffeeViewModel(isPresented: .constant(false))
            .previewDevice("iPhone 12 Pro")
    }
}

// for coffee cell view
struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding([.leading],20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark": "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}

