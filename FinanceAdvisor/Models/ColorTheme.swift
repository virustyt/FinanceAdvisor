//
//  ColorTheme.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 10.01.2022.
//

import UIKit

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
