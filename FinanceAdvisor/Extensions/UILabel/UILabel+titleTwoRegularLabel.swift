//
//  UILabel+titleTwoRegularLabel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 28.12.2021.
//

import UIKit

extension UILabel {

    static var titleTwoRegularLabel: UILabel{
        let label = UILabel()
        label.font = R.font.montserratRegular(size: 18)
        label.textColor = UIColor.rickBlack
        return label
    }
}
