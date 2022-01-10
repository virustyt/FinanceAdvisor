//
//  CreationEditingViewModel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import Foundation

protocol WalletCreatingEditingWalletProtocol {

    var manager: WalletManagerProtocol { get }

    var walletIdentifier: UUID {get set}

    func updateWalletTitle(to title: String)

    init(walletIdentifier uuid: UUID)
}

class WalletCreationEditingViewModel: WalletCreatingEditingWalletProtocol {

    internal var manager: WalletManagerProtocol = WalletManager.shared

    internal var walletIdentifier: UUID

    func updateWalletTitle(to title: String) {
        manager.setTitle(to: title, for: walletIdentifier)
    }

    required init(walletIdentifier uuid: UUID) {
        walletIdentifier = uuid
    }
}
