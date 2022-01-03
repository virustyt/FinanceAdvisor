//
//  WalletCreation-EditingViewController.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 29.12.2021.
//

import UIKit

fileprivate extension Consts {
    static let addNewWalletViewTopInset: CGFloat = UIScreen.main.bounds.height / 29.86 // 60
    static let addNewWalletViewLeadingInset: CGFloat = UIScreen.main.bounds.width / 24.35 // 17
    static let addNewWalletViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 24.35 // 17
    static let addNewWalletViewBottomInset: CGFloat = UIScreen.main.bounds.width / 22.4 // 40

    static let currencyViewTopInset: CGFloat = UIScreen.main.bounds.width / 22.4 // 40
    static let currencyViewLeadingInset: CGFloat = UIScreen.main.bounds.width / 24.35 // 17
    static let currencyViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 24.35 // 17
    static let currencyViewBottomInset: CGFloat = UIScreen.main.bounds.height / 44.8 // 20

    static let colorThemeViewTopInset: CGFloat = UIScreen.main.bounds.width / 22.4 // 40
    static let colorThemeViewLeadingInset: CGFloat = UIScreen.main.bounds.width / 24.35 // 17
    static let colorThemeViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 24.35 // 17
    static let colorThemeViewBottomInset: CGFloat = UIScreen.main.bounds.height / 44.8 // 20

    static let titleViewTopInset: CGFloat = UIScreen.main.bounds.height / 44.8 // 20
    static let titleViewLeadingInset: CGFloat = UIScreen.main.bounds.width / 24.35 // 17
    static let titleViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 24.35 // 17
    static let titleViewBottomInset: CGFloat = UIScreen.main.bounds.height / 8.37 // 107
}

class WalletCreationEditingViewController: BaseViewController {

    private let addNewWalletRightButtonTapClouser: (() -> Void)? = nil
    private let currencyViewTapClouser: (() -> Void)? = nil
    private let titleViewTapClouser: (() -> Void)? = nil
    private let colorThemeTapClouser: (() -> Void)? = nil

    private lazy var addNewWalletView = ScreenTitleView(title: LocalizeKeys.addNewWallet.localized(),
                                            rightButtonImage: R.image.back(),
                                            rightButtonTapClouser: addNewWalletRightButtonTapClouser)

    private lazy var scrollView = UIScrollView()
    private let containerForViews = UIView()

    private lazy var colorThemeView = ColorThemeView(tapClouser: colorThemeTapClouser)
    private lazy var currencyView = CurrencyView(clouser: currencyViewTapClouser)
    private lazy var titleView = BottomTitleView(clouser: titleViewTapClouser)
    private let backgroundGradientView = UIImageView(image: R.image.backGradientFive())

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraints()
    }

    // MARK: - private funcs
    private func setUpConstraints() {
        view.addSubview(backgroundGradientView)
        view.addSubview(addNewWalletView)
        view.addSubview(colorThemeView)
        view.addSubview(currencyView)
        view.addSubview(titleView)

        backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        addNewWalletView.translatesAutoresizingMaskIntoConstraints = false
        currencyView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        colorThemeView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundGradientView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundGradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundGradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundGradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            addNewWalletView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                  constant: Consts.addNewWalletViewTopInset),
            addNewWalletView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                      constant: Consts.addNewWalletViewLeadingInset),
            addNewWalletView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                       constant: -Consts.addNewWalletViewTrailingInset),

            colorThemeView.topAnchor.constraint(equalTo: addNewWalletView.bottomAnchor, constant: Consts.colorThemeViewTopInset),
            colorThemeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.colorThemeViewLeadingInset),
            colorThemeView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -Consts.colorThemeViewTrailingInset),

            currencyView.topAnchor.constraint(equalTo: colorThemeView.bottomAnchor, constant: Consts.currencyViewTopInset),
            currencyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.currencyViewLeadingInset),
            currencyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Consts.currencyViewTrailingInset),

            titleView.topAnchor.constraint(equalTo: currencyView.bottomAnchor, constant: Consts.titleViewTopInset),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.titleViewLeadingInset),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Consts.titleViewTrailingInset)
        ])
        let titleViewBottomConstraint = titleView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor,
                                                                          constant: -Consts.titleViewBottomInset)
        titleViewBottomConstraint.priority = .defaultLow
        titleViewBottomConstraint.isActive = true
    }
}
