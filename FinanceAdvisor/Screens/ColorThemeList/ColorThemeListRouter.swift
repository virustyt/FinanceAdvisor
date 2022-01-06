//
//  ColorThemeListRouter.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 06.01.2022.
//

import Foundation

protocol ColorThemeListRouterProtocol {

    func showCreationEditingWalletVC()
}

class ColorThemeListRouter: BaseRouter, ColorThemeListRouterProtocol {
    
    func showCreationEditingWalletVC() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
