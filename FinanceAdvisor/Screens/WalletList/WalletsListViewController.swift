//
//  WalletsListViewController.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 27.12.2021.
//

import UIKit
import Localize_Swift

fileprivate extension Consts {
    static let collectionViewLeadingInset: CGFloat = (CGFloat) ((Int) (UIScreen.main.bounds.width * 0.05))
    static let collectionViewTrailingInset: CGFloat = (CGFloat) ((Int) (UIScreen.main.bounds.width * 0.05))
    static let addWalletButtonTopInset: CGFloat = UIScreen.main.bounds.height / 29.86
    static let collectionViewTopInset: CGFloat = UIScreen.main.bounds.width / 21

    static let cellMinWidth: CGFloat = 208
    static let cellWidth: CGFloat = UIScreen.main.bounds.width - collectionViewLeadingInset - collectionViewTrailingInset

    static let heightToWidthCellRatio: CGFloat = 0.547
    static let cellHeight: CGFloat = cellWidth * heightToWidthCellRatio < cellMinWidth ?
        cellMinWidth : cellWidth * heightToWidthCellRatio

    static let addButtonHeight: CGFloat = UIScreen.main.bounds.width * 0.18
}

class WalletsListViewController: BaseViewController {

    private var viewModel: WalletListViewModelProtocol = WalletListViewModel()
    private lazy var router: WalletListRouterProtocol = WalletListRouter(viewController: self)

    private lazy var emptyCollectionViewLabel: UILabel = {
        let label = UILabel.titleOneLabel
        label.text = LocalizeKeys.noWallets.localized()
        label.isHidden = true
        return label
    }()

    private lazy var addWalletButton = ScreenTitleView(title: LocalizeKeys.wallets.localized(),
                                     leftButtonImage: R.image.add(),
                                     leftButtonTapClouser: addButtonTapped)

    private let backgroundGradientView = UIImageView(image: R.image.backGradientTwo())

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)

        return collectionView
    }()

    // MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraints()
    }

    // MARK: - life cycle
    override func viewWillLayoutSubviews() {
        // if model is empty, unhide emptyCollectionViewLabel
        emptyCollectionViewLabel.isHidden = false
    }

    // MARK: - private funcs
    private func setUpConstraints() {
        view.addSubview(backgroundGradientView)
        view.addSubview(collectionView)
        view.addSubview(addWalletButton)
        view.addSubview(emptyCollectionViewLabel)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addWalletButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        emptyCollectionViewLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundGradientView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundGradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundGradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundGradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            addWalletButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Consts.addWalletButtonTopInset),
            addWalletButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.collectionViewLeadingInset),
            addWalletButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Consts.collectionViewTrailingInset),
            addWalletButton.heightAnchor.constraint(equalToConstant: Consts.addButtonHeight),

            collectionView.topAnchor.constraint(equalTo: addWalletButton.bottomAnchor,
                                               constant: Consts.collectionViewTopInset),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.collectionViewLeadingInset),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Consts.collectionViewTrailingInset),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            emptyCollectionViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyCollectionViewLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func addButtonTapped() {
        router.showWalletCreationEditingVC()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WalletsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Consts.cellWidth,
                      height: Consts.cellHeight)
    }
}

// MARK: - UICollectionViewDataSource
extension WalletsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.walletsCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
