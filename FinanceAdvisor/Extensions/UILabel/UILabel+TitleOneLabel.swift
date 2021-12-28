//
//  UILabel+TitleOneLabel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 27.12.2021.
//

import UIKit

extension UILabel {

    static var titleOneLabel: UILabel{
        let label = UILabel()
        label.font = R.font.montserratSemiBold(size: 24)
        label.textColor = .black
        return label
    }
}
