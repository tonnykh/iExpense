//
//  ContentView.swift
//  iExpense
//
//  Created by Khumbongmayum Tonny on 25/06/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showAddExpense: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { expense in
                    Text(expense.name)
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
//                    let expense = ExpenseItem(name: "Tonny", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                    showAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddExpense) {
                AddView()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
