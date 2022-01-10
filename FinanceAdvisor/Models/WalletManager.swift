//
//  Manager.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import Foundation

protocol WalletManagerProtocol {

    static var shared: WalletManagerProtocol { get }

    var wallets: [Wallet] { get }

    var editingWalletIdentifyer: UUID? { get }

    func setEditingWallet(toWalletWithIndex index: Int )

    func addEmptyWallet()

    func setTitle(to title: String, for walletIdentifier: UUID)

    func setCurrency(to currency: Currency, for walletIdentifier: UUID)

    func setBalance(to balance: Double, for walletIdentifier: UUID)

    func setLastChangeDate(to date: String, for walletIdentifier: UUID)

    func setColorTheme(to theme: ColorTheme, for walletIdentifier: UUID)

    func addTransaction(_ transaction: Transaction, for walletIdentifier: UUID)

    func removeTransaction(withIndex: Int, for walletIdentifier: UUID)
}

class WalletManager: WalletManagerProtocol {

    static var shared: WalletManagerProtocol = WalletManager()

    var wallets = [Wallet]()
    var editingWalletIdentifyer: UUID?

    // MARK: - public funcs
    func setEditingWallet(toWalletWithIndex index: Int) {
        editingWalletIdentifyer = wallets[index].identifier
    }

    func addEmptyWallet() {
        let newEmptyWallet = Wallet()
        editingWalletIdentifyer = newEmptyWallet.identifier
    }

    func setTitle(to title: String, for walletIdentifier: UUID) {

    }

    func setCurrency(to currency: Currency, for walletIdentifier: UUID) {
    }

    func setBalance(to balance: Double, for walletIdentifier: UUID) {

    }

    func setLastChangeDate(to date: String, for walletIdentifier: UUID) {

    }

    func setColorTheme(to theme: ColorTheme, for walletIdentifier: UUID) {

    }

    func addTransaction(_ transaction: Transaction, for walletIdentifier: UUID) {

    }

    func removeTransaction(withIndex: Int, for walletIdentifier: UUID) {

    }
}
