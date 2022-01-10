//
//  WalletListRouter.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import UIKit

protocol WalletListRouterProtocol {
    func showWalletCreationEditingVC(forWalletWithIdentifier identifier: UUID)
}

class WalletListRouter: BaseRouter, WalletListRouterProtocol {

    func showWalletCreationEditingVC(forWalletWithIdentifier identifier: UUID) {
        let walletCreationEditingVC = WalletCreationEditingViewController(chousenWalletIdentifier: identifier)

        walletCreationEditingVC.modalPresentationStyle = .overFullScreen
        walletCreationEditingVC.modalTransitionStyle = .coverVertical
        viewController?.navigationController?.pushViewController(walletCreationEditingVC, animated: true)
    }
}
