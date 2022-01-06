//
//  CreationEditingRouter.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import Foundation

protocol WalletCreationEditingRouterProtocol {
    func showChoosingColorThemeVC()

    func showChoosingCurrencyVC()

    func showWalletList()
}

class WalletCreationEditingRouter: BaseRouter, WalletCreationEditingRouterProtocol {

    func showChoosingColorThemeVC() {
    }

    func showChoosingCurrencyVC() {
    }

    func showWalletList() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
