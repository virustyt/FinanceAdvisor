//
//  WalletListViewModel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import UIKit

protocol WalletListViewModelProtocol {

    func addEmptyWallet()

    func setEditingWallet(toWalletWithIndex item: Int)

    func walletsCount() -> Int
}

class WalletListViewModel: WalletListViewModelProtocol {

    private let manager: WalletManagerProtocol = WalletManager.shared

    func addEmptyWallet() {
        manager.addEmptyWallet()
    }

    func walletsCount() -> Int {
        manager.wallets.count
    }

    func setEditingWallet(toWalletWithIndex index: Int) {
        manager.setEditingWallet(toWalletWithIndex: index)
    }
}
