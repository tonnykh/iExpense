//
//  Expenses.swift
//  iExpense
//
//  Created by Khumbongmayum Tonny on 25/06/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] = []
}
