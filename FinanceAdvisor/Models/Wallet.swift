//
//  Wallet.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 02.01.2022.
//

import Foundation

class Wallet {

    let identifier: UUID = UUID()

    var currency: Currency = Currency(name: "USD", code: "$")

    var title: String = "no title"
    var balance: Double = 0
    var lastChangeDate: String = "no changes"

    var transactions = [Transaction]()

    var colorTheme: ColorTheme = .twoself.lastChangeDate = lastChangeDate
    }
}
