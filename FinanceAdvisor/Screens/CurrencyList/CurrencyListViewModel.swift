//
//  CurrencyListViewModel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 06.01.2022.
//

import UIKit

protocol CurrencyListViewModelProtocol {

    var walletIndex: Int {get set}
    var selectedCurrencyIndex: Int? {get set}

    func updateWalletCurrency()
    func setCurrency(to cell: CurrencyListCollectionViewCell, byIndex index: Int)
    func getBackgroundView() -> UIImage

    init(forWalletWithIndex index: Int)
}

class CurrencyListViewModel: CurrencyListViewModelProtocol {
    // this code will be right after feature 4 will be merged
    // private var manager: Manager = Manager.shared

    internal var walletIndex: Int
    internal var selectedCurrencyIndex: Int?

    func updateWalletCurrency() {
        guard let newCurrencyIndex = selectedCurrencyIndex else { return }
        let newCurrency = Currency.allCurrencies[newCurrencyIndex]
        // update wallet currency here - ( manager does not exist in this branch yet ) -
    }

    func setCurrency(to cell: CurrencyListCollectionViewCell, byIndex index: Int) {
        let currency = Currency.allCurrencies[index]
        cell.setCellsCurrency(to: currency)
    }

    func getBackgroundView() -> UIImage {
        // code below have to be replaced after feature 4 will be merdged - correct Wallet class needed
        let backgroundGradientImage = R.image.backGradientTwo() ?? UIImage()
        return backgroundGradientImage
    }

    required init(forWalletWithIndex index: Int) {
        self.walletIndex = index
    }
}
