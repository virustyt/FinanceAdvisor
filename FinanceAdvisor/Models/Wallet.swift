//
//  Wallet.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 02.01.2022.
//

import Foundation

class Wallet {

    var walletTitle: String
    var colorThemeNumber: Int

    var currencyTitle: String
    var currencySign: String
    var totalSumOfMoney: Int
    var lastChangeDate: String

    // var transactions: [Transaction]?

    init(title: String,
         themeNumber: Int,
         currencyTitle: String,
         currencySign: String,
         totalSumOfMoney: Int,
         lastChangeDate: String) {

        self.walletTitle = title
        self.colorThemeNumber = themeNumber

        self.currencyTitle = currencyTitle
        self.currencySign = currencySign
        self.totalSumOfMoney = totalSumOfMoney
        self.lastChangeDate = lastChangeDate
    }
}
