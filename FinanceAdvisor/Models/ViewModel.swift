//
//  ViewModel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import Foundation

protocol WalletEditingProtocol {

    func addEmptyWallet()

    func setTitle(to title: String, for walletIndex: Int)

    func setCurrency(to currency: Currency, for walletIndex: Int)

    func setBalance(to balance: Double, for walletIndex: Int)

    func setLastChangeDate(to date: String, for walletIndex: Int)

    func setColorTheme(to theme: Wallet.ColorTheme, for walletIndex: Int)

    func addTransaction(_ transaction: Transaction, for walletIndex: Int)

    func removeTransaction(withIndex index: Int, for walletIndex: Int)
}

class ViewModel: WalletEditingProtocol {

    var manager = Manager()

    // MARK: - public funcs
    func addEmptyWallet() {
        manager.addEmptyWallet()
    }

    func setTitle(to title: String, for walletIndex: Int) {
        manager.setTitle(to: title, for: walletIndex)
    }

    func setCurrency(to currency: Currency, for walletIndex: Int) {
        manager.setCurrency(to: currency, for: walletIndex)
    }

    func setBalance(to balance: Double, for walletIndex: Int) {
        manager.setBalance(to: balance, for: walletIndex)
    }

    func setLastChangeDate(to date: String, for walletIndex: Int) {
        manager.setLastChangeDate(to: date, for: walletIndex)
    }

    func setColorTheme(to theme: Wallet.ColorTheme, for walletIndex: Int) {
        manager.setColorTheme(to: theme, for: walletIndex)
    }

    func addTransaction(_ transaction: Transaction, for walletIndex: Int) {
        manager.addTransaction(transaction, for: walletIndex)
    }

    func removeTransaction(withIndex index: Int, for walletIndex: Int) {
        manager.removeTransaction(withIndex: index, for: walletIndex)
    }
}
