//
//  ClolorThemeListViewController.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 02.01.2022.
//

import UIKit

fileprivate extension Consts {
    static let collectionViewLeadingInset: CGFloat = (CGFloat) ((Int) (UIScreen.main.bounds.width * 0.05))
    static let collectionViewTrailingInset: CGFloat = (CGFloat) ((Int) (UIScreen.main.bounds.width * 0.05))
    static let addWalletButtonTopInset: CGFloat = 75.75
    static let collectionViewTopInset: CGFloat = 40

    static let heightToWidthCellRatio: CGFloat = 0.547
    static let cellWidth: CGFloat = UIScreen.main.bounds.width - collectionViewLeadingInset - collectionViewTrailingInset
    static let cellHeight: CGFloat = cellWidth * heightToWidthCellRatio

    static let addButtonHeight: CGFloat = UIScreen.main.bounds.width * 0.18
}

class ClolorThemeListViewController: UIViewController {

    private lazy var backButton = UIView()

    // this need to be a right code for backButton after #4 branch will be merged
//    private lazy var backButton = ScreenTitleView(title: LocalizeKeys.colorThemes.localized(),
//                                         leftButtonImage: R.image.back(),
//                                         leftButtonTapClouser: backButtonTapped)

    private lazy var colorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(ColorThemeCollectionViewCell.self, forCellWithReuseIdentifier: ColorThemeCollectionViewCell.identifyer)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    private let themeColorImages: [UIImage?] = [R.image.backGradientOne(),
                                               R.image.backGradientTwo(),
                                               R.image.backGradientThree(),
                                               R.image.backGradientFour(),
                                               R.image.backGradientFive() ]

    private var backgroundGradientView = UIImageView(image: R.image.backGradientTwo())

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPConstraints()
    }

    // MARK: - private funcs
    @objc private func backButtonTapped() {
        
    }

    private func setUPConstraints() {
        view.addSubview(backgroundGradientView)
        view.addSubview(backButton)
        view.addSubview(colorsCollectionView)

        backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        colorsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundGradientView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundGradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundGradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundGradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Consts.addWalletButtonTopInset),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.collectionViewLeadingInset),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Consts.collectionViewTrailingInset),
            backButton.heightAnchor.constraint(equalToConstant: Consts.addButtonHeight),

            colorsCollectionView.topAnchor.constraint(equalTo: backButton.bottomAnchor,
                                                      constant: Consts.collectionViewTopInset),
            colorsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Consts.collectionViewLeadingInset),
            colorsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Consts.collectionViewTrailingInset),
            colorsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ClolorThemeListViewController: UICollectionViewDelegateFlowLayout {

}

// MARK: - UICollectionViewDataSource
extension ClolorThemeListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        themeColorImages.filter { $0 != nil }.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorThemeCollectionViewCell.identifyer,
                                                            for: indexPath) as? ColorThemeCollectionViewCell
        else { return UICollectionViewCell() }

        guard let colorImage = themeColorImages.filter({ $0 != nil })[indexPath.item]
        else { return cell }
        cell.setColorImage(image: colorImage)

        return cell
    }
}
