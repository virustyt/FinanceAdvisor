//
//  ViewController.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 30.12.2021.
//

import UIKit

class BaseRouter {

    weak var viewController: BaseViewController?

    init(viewController: BaseViewController) {
        self.viewController = viewController
    }
}
