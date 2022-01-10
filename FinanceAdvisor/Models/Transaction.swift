//
//  Transaction.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import Foundation

struct Transaction {
    let identifier: UUID = UUID()

    var title: String = "no title"
    var sum: Double = 0
    var direction: Direction = .income
    var date: String = "no date"

    enum Direction {
        case income, outcome
    }
}
