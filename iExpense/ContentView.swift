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
    @State private var type: String = "Personal"
    
    let types: [String] = ["Business", "Personal"]

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                ForEach(expenses.items) { expense in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)
                            Text(expense.type)
                        }
                        
                        Spacer()
                        Text(expense.amount, format: .currency(code: "INR"))
                            .foregroundColor(
                                expense.amount >= 1000 ?
                                    .red :
                                    expense.amount > 10 ?
                                    .orange :
                                    .green
                            )
                    }
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddExpense) {
                AddView(expenses: expenses)
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
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
