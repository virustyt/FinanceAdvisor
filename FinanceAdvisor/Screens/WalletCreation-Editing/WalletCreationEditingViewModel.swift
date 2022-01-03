//
//  CreationEditingViewModel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import Foundation

protocol WalletCreatingEditingWallet {

    func backButtonTaped()
    func currencyViewTaped()
    func colorThemeTaped()
}

class WalletCreationEditingViewModel: WalletCreatingEditingWallet {

    private let router: WalletCreationEditingRouterProtocol?

    func backButtonTaped() {
        router?.showWalletList()
    }

    func currencyViewTaped() {
        router?.showChoosingCurrencyVC()
    }

    func colorThemeTaped() {
        router?.showChoosingColorThemeVC()
    }

    init(router: WalletCreationEditingRouterProtocol) {
        self.router = router
    }
}
