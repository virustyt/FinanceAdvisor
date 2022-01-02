//
//  Transaction.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 02.01.2022.
//

import Foundation

struct Transaction {

    var title: String
    var date: String
    var sum: Int
    var currencyTitle: String
    var moneyDirection: MoneyDirection
    var note: String

    enum MoneyDirection {
        case income, outcome
    }
}
