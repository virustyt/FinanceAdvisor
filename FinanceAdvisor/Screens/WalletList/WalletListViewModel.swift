//
//  WalletListViewModel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import UIKit

protocol WalletListViewModelProtocol {
    func getWalletBy(index: Int) -> Wallet

    func walletsCount() -> Int
}

class WalletListViewModel: WalletListViewModelProtocol {

    private let manager = Manager.shared

    private let router: WalletListRouterProtocol?

    func walletsCount() -> Int {
        manager.wallets.count
    }

    func getWalletBy(index: Int) -> Wallet{
        manager.wallets[index]
    }

    init(router: WalletListRouterProtocol) {
        self.router = router
    }
}
