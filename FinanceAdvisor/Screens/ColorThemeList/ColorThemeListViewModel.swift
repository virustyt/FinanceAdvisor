//
//  ViewModel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 06.01.2022.
//

import UIKit

protocol ColorThemeListViewModelProtocol {

    var manager: WalletManagerProtocol { get }

    var chousenColorTheme: ColorTheme? {get set}

    func updateColorTheme()
}

class ColorThemeListViewModel: ColorThemeListViewModelProtocol {

    var manager: WalletManagerProtocol = WalletManager.shared

    var chousenColorTheme: ColorTheme?

    func updateColorTheme() {
        guard let colorTheme = chousenColorTheme,
              let walletIdentifier = manager.editingWalletIdentifyer
        else { return }
        manager.setColorTheme(to: colorTheme, for: walletIdentifier)
    }
}
