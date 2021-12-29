//
//  WalletsListViewController.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 27.12.2021.
//

import UIKit
import Localize_Swift

class WalletsListViewController: UIViewController {

    enum Constants {
        static let collectionViewLeadingInset: CGFloat = (CGFloat) ((Int) (UIScreen.main.bounds.width * 0.05))
        static let collectionViewTrailingInset: CGFloat = (CGFloat) ((Int) (UIScreen.main.bounds.width * 0.05))
        static let addWalletButtonTopInset: CGFloat = 75.75
        static let collectionViewTopInset: CGFloat = 40

        static let cellMinWidth: CGFloat = 208
        static let cellWidth: CGFloat = UIScreen.main.bounds.width - collectionViewLeadingInset - collectionViewTrailingInset

        static let heightToWidthCellRatio: CGFloat = 0.547
        static let cellHeight: CGFloat = cellWidth * heightToWidthCellRatio < cellMinWidth ?
            cellMinWidth : cellWidth * heightToWidthCellRatio

        static let addButtonHeight: CGFloat = UIScreen.main.bounds.width * 0.18
    }

    private lazy var emptyCollectionViewLabel: UILabel = {
        let label = UILabel.titleOneLabel
        label.text = LocalizeKeys.noWallets.localized()
        label.isHidden = true
        return label
    }()

    private lazy var addWalletButton: UIView = {
        let button = AddWalletButton()
        return button
    }()

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

            addWalletButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.addWalletButtonTopInset),
            addWalletButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.collectionViewLeadingInset),
            addWalletButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.collectionViewTrailingInset),
            addWalletButton.heightAnchor.constraint(equalToConstant: Constants.addButtonHeight),

            collectionView.topAnchor.constraint(equalTo: addWalletButton.bottomAnchor,
                                               constant: Constants.collectionViewTopInset),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.collectionViewLeadingInset),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.collectionViewTrailingInset),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            emptyCollectionViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyCollectionViewLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
