//
//  CurrencyListRouter.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 07.01.2022.
//

import Foundation

protocol CurrencyListRouterProtocol {

    func showCreationEditingVC()
}

class CurrencyListRouter: BaseRouter, CurrencyListRouterProtocol {

    func showCreationEditingVC() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
