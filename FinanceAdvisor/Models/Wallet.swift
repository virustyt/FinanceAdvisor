//
//  Wallet.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import UIKit

class Wallet {

    let identifier: UUID = UUID()

    var currency: Currency = Currency(name: "USD", code: "$")

    var title: String = "no title"
    var balance: Double = 0
    var lastChangeDate: String = "no changes"

    var transactions = [Transaction]()

    var colorTheme: ColorTheme = .two
}
