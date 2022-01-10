//
//  WalletListRouter.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import UIKit

protocol WalletListRouterProtocol {

    func showWalletCreationEditingVC()
}

class WalletListRouter: BaseRouter, WalletListRouterProtocol {

    func showWalletCreationEditingVC() {
        guard let identifier = WalletManager.shared.editingWalletIdentifyer else { return }

        let walletCreationEditingVC = WalletCreationEditingViewController(chousenWalletIdentifier: identifier)

        walletCreationEditingVC.modalPresentationStyle = .overFullScreen
        walletCreationEditingVC.modalTransitionStyle = .coverVertical
        viewController?.navigationController?.pushViewController(walletCreationEditingVC, animated: true)
    }
}
