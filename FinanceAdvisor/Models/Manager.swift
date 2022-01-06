//
//  Manager.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import Foundation

class Manager {

    static let shared = Manager()

    private(set) var wallets = [Wallet]()

    // MARK: - public funcs
    func addEmptyWallet() {

    }

    func setTitle(to title: String, for walletIndex: Int) {

    }

    func setCurrency(to currency: Currency, for walletIndex: Int) {
    }

    func setBalance(to balance: Double, for walletIndex: Int) {

    }

    func setLastChangeDate(to date: String, for walletIndex: Int) {

    }

    func setColorTheme(to theme: Wallet.ColorTheme, for walletIndex: Int) {

    }

    func addTransaction(_: Transaction, for walletIndex: Int) {

    }

    func removeTransaction(withIndex: Int, for walletIndex: Int) {

    }
}
