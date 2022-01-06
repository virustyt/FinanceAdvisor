//
//  Wallet.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import UIKit

class Wallet {
    var currency: Currency = Currency(name: "USD", code: "$")

    var title: String = "no title"
    var balance: Double = 0
    var lastChangeDate: String = "no changes"

    var transactions = [Transaction]()

    var colorTheme: ColorTheme = .two

    enum ColorTheme: CaseIterable {

        case one, two, three, four, five

        var themeImage: UIImage? {
            switch self {
            case .one:
                return R.image.backGradientOne()
            case .two:
                return R.image.backGradientTwo()
            case .three:
                return R.image.backGradientThree()
            case .four:
                return R.image.backGradientFour()
            case .five:
                return R.image.backGradientFive()
            }
        }
    }
}
