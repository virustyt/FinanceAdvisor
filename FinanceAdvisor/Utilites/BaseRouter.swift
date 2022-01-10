//
//  BaseRouter.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 06.01.2022.
//

import UIKit

class BaseRouter {

    weak var viewController: BaseViewController?

    init(viewController: BaseViewController) {
        self.viewController = viewController
    }
}
