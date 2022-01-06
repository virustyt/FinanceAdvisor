//
//  CreationEditingViewModel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import Foundation

protocol WalletCreatingEditingWalletProtocol {

    var walletIndex: Int {get set}

    func updateWalletTitle(to title: String)

    init(forWalletWithIndex index: Int)
}

class WalletCreationEditingViewModel: WalletCreatingEditingWalletProtocol {

    private var manager: Manager = Manager.shared

    internal var walletIndex: Int

    func updateWalletTitle(to title: String) {
        manager.setTitle(to: title, for: walletIndex)
    }

    required init(forWalletWithIndex index: Int) {
        walletIndex = index
    }
}
