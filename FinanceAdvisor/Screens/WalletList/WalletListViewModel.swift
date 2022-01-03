//
//  WalletListViewModel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 03.01.2022.
//

import UIKit

protocol WalletListViewModelProtocol {
    func getWalletBy(index: Int) -> Wallet

    func walletsCount() -> Int
}

class WalletListViewModel: WalletListViewModelProtocol {

    let manager = Manager.shared

    func walletsCount() -> Int {
        manager.wallets.count
    }

    func getWalletBy(index: Int) -> Wallet{
        manager.wallets[index]
    }    
}
