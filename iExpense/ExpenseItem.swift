//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Khumbongmayum Tonny on 25/06/23.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
