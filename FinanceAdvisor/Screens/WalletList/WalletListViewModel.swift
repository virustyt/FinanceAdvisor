//
//  WalletListViewModel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import UIKit

protocol WalletListViewModelProtocol {

    var newWalletsIdentifier: UUID? { get }

    func addEmptyWallet()

    func getWalletBy(collectionViewItem item: Int) -> Wallet

    func walletsCount() -> Int
}

class WalletListViewModel: WalletListViewModelProtocol {

    private let manager: WalletManagerProtocol = WalletManager.shared

    var newWalletsIdentifier: UUID?

    func addEmptyWallet() {
        let newWalletIdentifier = manager.addEmptyWallet()
        self.newWalletsIdentifier = newWalletIdentifier
    }

    func walletsCount() -> Int {
        manager.wallets.count
    }

    func getWalletBy(collectionViewItem item: Int) -> Wallet {
        manager.wallets[item]
    }
}
