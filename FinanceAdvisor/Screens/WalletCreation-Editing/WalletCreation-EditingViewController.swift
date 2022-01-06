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
    static let titleViewBottomInset: CGFloat = 0

    static let statusBarHeight: CGFloat = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
}

class WalletCreationEditingViewController: BaseViewController {

    private var viewModel: WalletCreatingEditingWallet = WalletCreationEditingViewModel()
    private lazy var router: WalletCreationEditingRouterProtocol = WalletCreationEditingRouter(viewController: self)

    private lazy var backEditWalletView = ScreenTitleView(title: LocalizeKeys.addNewWallet.localized(),
                                            rightButtonImage: R.image.back(),
                                            rightButtonTapClouser: backButtonTapped)

    private lazy var scrollView = UIScrollView()
    private let containerForViews = UIView()

    private lazy var colorThemeView = ColorThemeView(clouser: colorThemeViewTapped)
    private lazy var currencyView = CurrencyView(clouser: currencyViewTappped)
    private lazy var titleView: BottomTitleView = {
        let view = BottomTitleView()
        view.setTextfieldDelegate(to: self)
        return view
    }()

    private let backgroundGradientView = UIImageView(image: R.image.backGradientFive())

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraints()
    }

    // MARK: - private funcs

    //  swiftlint:disable function_body_length
    private func setUpConstraints() {
        view.addSubview(scrollView)
        view.addSubview(backEditWalletView)

        scrollView.addSubview(containerForViews)

        containerForViews.addSubview(backgroundGradientView)
        containerForViews.addSubview(colorThemeView)
        containerForViews.addSubview(currencyView)
        containerForViews.addSubview(titleView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerForViews.translatesAutoresizingMaskIntoConstraints = false

        backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        backEditWalletView.translatesAutoresizingMaskIntoConstraints = false
        currencyView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        colorThemeView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            backgroundGradientView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundGradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundGradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundGradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            containerForViews.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerForViews.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerForViews.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerForViews.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            containerForViews.widthAnchor.constraint(equalTo: view.widthAnchor),

            backEditWalletView.topAnchor.constraint(equalTo: containerForViews.topAnchor,
                                                  constant: Consts.addNewWalletViewTopInset),
            backEditWalletView.leadingAnchor.constraint(equalTo: containerForViews.leadingAnchor,
                                                      constant: Consts.addNewWalletViewLeadingInset),
            backEditWalletView.trailingAnchor.constraint(equalTo: containerForViews.trailingAnchor,
                                                       constant: -Consts.addNewWalletViewTrailingInset),

            colorThemeView.topAnchor.constraint(equalTo: backEditWalletView.bottomAnchor, constant: Consts.colorThemeViewTopInset),
            colorThemeView.leadingAnchor.constraint(equalTo: containerForViews.leadingAnchor, constant: Consts.colorThemeViewLeadingInset),
            colorThemeView.trailingAnchor.constraint(equalTo: containerForViews.trailingAnchor,
                                                     constant: -Consts.colorThemeViewTrailingInset),

            currencyView.topAnchor.constraint(equalTo: colorThemeView.bottomAnchor, constant: Consts.currencyViewTopInset),
            currencyView.leadingAnchor.constraint(equalTo: containerForViews.leadingAnchor, constant: Consts.currencyViewLeadingInset),
            currencyView.trailingAnchor.constraint(equalTo: containerForViews.trailingAnchor, constant: -Consts.currencyViewTrailingInset),

            titleView.topAnchor.constraint(equalTo: currencyView.bottomAnchor, constant: Consts.titleViewTopInset),
            titleView.leadingAnchor.constraint(equalTo: containerForViews.leadingAnchor, constant: Consts.titleViewLeadingInset),
            titleView.trailingAnchor.constraint(equalTo: containerForViews.trailingAnchor, constant: -Consts.titleViewTrailingInset)
        ])
        let titleViewBottomConstraint = titleView.bottomAnchor.constraint(equalTo: containerForViews.bottomAnchor,
                                                                                  constant: -Consts.titleViewBottomInset)
        titleViewBottomConstraint.priority = .defaultLow
        titleViewBottomConstraint.isActive = true
    }
    // swiftlint:enable function_body_length

    @objc private func colorThemeViewTapped() {
        router.showChoosingColorThemeVC()
    }

    @objc private func currencyViewTappped() {
        router.showChoosingCurrencyVC()
    }

    @objc private func backButtonTapped() {
        router.showWalletList()
    }

    @objc func pushUpViewForKeyboard() {

    }
}

extension WalletCreationEditingViewController: UITextFieldDelegate {

}
