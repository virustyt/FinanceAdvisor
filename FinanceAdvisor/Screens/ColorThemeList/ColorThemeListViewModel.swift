//
//  ViewModel.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 06.01.2022.
//

import UIKit

protocol ColorThemeListViewModelProtocol {

    var chousenColorImage: UIImage? {get set}

    func updateColorTheme()
}

class ColorThemeListViewModel: ColorThemeListViewModelProtocol {

    // this will be the right code after feature 4 will be merged
    // private var manager: Manager = Manager.shared
    
    var chousenColorImage: UIImage?

    func updateColorTheme() {
        // code here will be written after feature 4 will be merged - need right implimentation for Wallet class
        if chousenColorImage != nil {
            // pdate wallet color theme
        }
    }
}
