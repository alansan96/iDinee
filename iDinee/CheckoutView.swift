//
//  CheckoutView.swift
//  iDinee
//
//  Created by Alan Santoso on 16/10/20.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10,15,20,25,0]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form{
            VStack{
                Section{
                    Picker("How do you want to pay", selection: $paymentType) {
                        ForEach( 0 ..< Self.paymentTypes.count){
                            Text(Self.paymentTypes[$0])
                        }
                    }
                    Toggle(isOn: $addLoyaltyDetails.animation(), label: {
                        Text("Add iDine loyalty card")
                    })
                    if addLoyaltyDetails {
                        TextField("Enter your iDine ID", text: $loyaltyNumber)
                    }
                }
                
                Section(header: Text("Add tips ?")) {
                    Picker("Percentage:", selection: $tipAmount) {
                        ForEach(0 ..< Self.tipAmounts.count) {
                            Text("\(Self.tipAmounts[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total: $\(totalPrice, specifier: "%.2f")")) {
                    Button("Confirm Button") {
                        self.showingPaymentAlert.toggle()
                    }
                }
                    
                
            }.navigationBarTitle(Text("Payment"), displayMode: .inline)
            .alert(isPresented: $showingPaymentAlert, content: {
                Alert(title: Text("pay now?"), message: Text("go pay"), dismissButton: .default(Text("ok")))
            })
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
