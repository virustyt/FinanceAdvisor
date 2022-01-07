//
//  CurrencyListViewComtroller.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 06.01.2022.
//

import UIKit

fileprivate extension Consts {
    static let backButtonTopInset: CGFloat = UIScreen.main.bounds.height / 49.77
    static let backButtonLeadingInset: CGFloat = (CGFloat) ((Int) (UIScreen.main.bounds.width * 0.04))
    static let backButtonTrailingInset: CGFloat = (CGFloat) ((Int) (UIScreen.main.bounds.width * 0.04))
    static let backButtonBottomInset: CGFloat = UIScreen.main.bounds.height / 22.4

    static let collectionViewLeadingInset: CGFloat = (CGFloat) ((Int) (UIScreen.main.bounds.width * 0.04))
    static let collectionViewTrailingInset: CGFloat = (CGFloat) ((Int) (UIScreen.main.bounds.width * 0.04))

    static let cellMinWidth: CGFloat = 208
    static let cellWidth: CGFloat = UIScreen.main.bounds.width - collectionViewLeadingInset - collectionViewTrailingInset

    static let heightToWidthCellRatio: CGFloat = 0.238
    static let cellHeight: CGFloat = cellWidth * heightToWidthCellRatio < cellMinWidth ?
        cellMinWidth : cellWidth * heightToWidthCellRatio
}

class CurrencyListViewController: BaseViewController {

    private var walletIndex: Int

    private lazy var viewModel: CurrencyListViewModelProtocol = CurrencyListViewModel(forWalletWithIndex: walletIndex)
    private lazy var router: CurrencyListRouter = CurrencyListRouter(viewController: self)

    // backButton created only for testing, will be replaced by ScreenTitleView after feature 4 will be merdged
    private lazy var backButton: UIView = {
        let view  = UIView()
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 12).isActive = true

        let tapGestureRecognizre = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        view.addGestureRecognizer(tapGestureRecognizre)
        return view
    }()

    // this need to be a right code for backButton after #4 branch will be merged
//    private lazy var backButton = ScreenTitleView(title: LocalizeKeys.colorThemes.localized(),
//                                         leftButtonImage: R.image.back(),
//                                         leftButtonTapClouser: backButtonTapped)

    private lazy var backgroundGradientView = UIImageView(image: viewModel.getBackgroundView())

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        collectionView.register(CurrencyListCollectionViewCell.self,
                                forCellWithReuseIdentifier: CurrencyListCollectionViewCell.identifyer)

        return collectionView
    }()

    private lazy var alertController: UIAlertController = {
        let alertController = UIAlertController(title: LocalizeKeys.saveChanges.localized(),
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: LocalizeKeys.yes.localized(),
                                                style: .default,
                                                handler: self.alertControllerYesTapped(action:)))
        alertController.addAction(UIAlertAction(title: LocalizeKeys.no.localized(),
                                                style: .default,
                                                handler: self.alertControllerNoTapped(action:)))
        return alertController
    }()

    // this property needed for width constraint of CurrencyListCollectionViewCell
    static var cellWidth: CGFloat = Consts.cellWidth

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraints()
    }

    // MARK: - ints
    init(forWalletWithIndex index: Int) {
        self.walletIndex = index
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs
    private func setUpConstraints() {
        view.addSubview(backgroundGradientView)
        view.addSubview(backButton)
        view.addSubview(collectionView)

        backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundGradientView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundGradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundGradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundGradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Consts.backButtonTopInset),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.backButtonTrailingInset),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Consts.backButtonLeadingInset),

            collectionView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Consts.backButtonBottomInset),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.collectionViewLeadingInset),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Consts.collectionViewLeadingInset),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc private func backButtonTapped() {
        if viewModel.selectedCurrencyIndex != nil {
            self.present(alertController, animated: true, completion: nil)
        } else {
            router.showCreationEditingVC()
        }
    }

    @objc private func alertControllerYesTapped(action: UIAlertAction) {
        viewModel.updateWalletCurrency()
        router.showCreationEditingVC()
    }

    @objc private func alertControllerNoTapped(action: UIAlertAction) {
        router.showCreationEditingVC()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CurrencyListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectedCurrencyIndex = indexPath.item
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Consts.cellWidth,
                      height: Consts.cellHeight)
    }
}

// MARK: - UICollectionViewDataSource
extension CurrencyListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Currency.allCurrencies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrencyListCollectionViewCell.identifyer,
                                                            for: indexPath) as? CurrencyListCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        viewModel.setCurrency(to: cell, byIndex: indexPath.item)
        return cell
    }
}
