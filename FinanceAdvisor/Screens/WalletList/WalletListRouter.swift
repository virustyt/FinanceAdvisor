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
        let walletCreationEditingVC = WalletCreationEditingViewController()

        walletCreationEditingVC.modalPresentationStyle = .overFullScreen
        walletCreationEditingVC.modalTransitionStyle = .coverVertical
        viewController?.present(walletCreationEditingVC, animated: true, completion: nil)
    }
}
