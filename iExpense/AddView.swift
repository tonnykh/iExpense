//
//  AddView.swift
//  iExpense
//
//  Created by Khumbongmayum Tonny on 25/06/23.
//

import SwiftUI

struct AddView: View {
    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var amount: Double = 0.0
    
    let types: [String] = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "INR"))
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add new expense")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
