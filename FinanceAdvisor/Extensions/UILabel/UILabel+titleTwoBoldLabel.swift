//
//  UILabel+titleTwoBoldLabel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 28.12.2021.
//

import UIKit

extension UILabel {
    
    static var titleTwoBoldLabel: UILabel{
        let label = UILabel()
        label.font = R.font.montserratSemiBold(size: 18)
        label.textColor = .black
        return label
    }
}
