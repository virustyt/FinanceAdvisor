//
//  WalletCollectionViewCell.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 27.12.2021.
//

import UIKit
import Localize_Swift

class WalletCollectionViewCell: UICollectionViewCell {

    struct Constants {
        static let walletNameStackViewTopInset: CGFloat = 20
        static let walletNameStackViewLeadingInset: CGFloat = 30
        static let walletNameStackViewTrailingInset: CGFloat = 35
        static let walletNameStackViewSpacing: CGFloat = 20

        static let walletBalanceLabelTopInset: CGFloat = 30
        static let walletBalanceLabelLeadingInset: CGFloat = 30

        static let lastChangeTitleLabelTopInset: CGFloat = 40
        static let lastChangeTitleLabelLeadingInset: CGFloat = 30

        static let lastChangeDateLabelTopInset: CGFloat = 10
        static let lastChangeDateLabelLeadingInset: CGFloat = 30
        static let lastChangeDateLabelBottomInset: CGFloat = 20
    }

    static let identifyer = String(describing: self)

    private let gradientLayer = CAGradientLayer()

    lazy var walletNameLabel: UILabel = {
        let label = UILabel.titleOneLabel
        label.text = "very laaaaaaaaaaaaaaaaaaarge name"
        label.numberOfLines = 0
        return label
    }()

    lazy var walletBalanceLabel: UILabel = {
        let label = UILabel.titleOneLabel
        label.textAlignment = .left
        label.text = "Balance"
        label.numberOfLines = 0
        return label
    }()

    private lazy var lastChangeTitleLabel: UILabel = {
        let label = UILabel.titleTwoBoldLabel
        label.text = LocalizeKeys.lastChange.localized()
        return label
    }()

    lazy var lastChangeDateLabel: UILabel = {
        let label = UILabel.titleTwoRegularLabel
        label.text = "Date"
        label.numberOfLines = 0
        return label
    }()

    private lazy var rightArrowImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.arrowRight())
        return imageView
    }()

    private lazy var walletNameStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [walletNameLabel, rightArrowImageView])
        stack.distribution = .fill
        walletNameLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        rightArrowImageView.setContentHuggingPriority(.required, for: .horizontal)
        stack.axis = .horizontal
        stack.alignment = .top
        stack.spacing = Constants.walletNameStackViewSpacing
        return stack
    }()

    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear.withAlphaComponent(0)
        setUpShadows()
        setUpGradientBackground()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs
    private func setUpConstraints() {
        contentView.addSubview(walletNameStackView)
        contentView.addSubview(walletBalanceLabel)
        contentView.addSubview(lastChangeTitleLabel)
        contentView.addSubview(lastChangeDateLabel)

        walletNameStackView.translatesAutoresizingMaskIntoConstraints = false
        walletBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        lastChangeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        lastChangeDateLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),

            widthAnchor.constraint(equalToConstant: WalletsListViewController.Constants.cellWidth),

            walletNameStackView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                     constant: Constants.walletNameStackViewTopInset),
            walletNameStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                         constant: Constants.walletNameStackViewLeadingInset),
            walletNameStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                          constant: -Constants.walletNameStackViewTrailingInset),

            walletBalanceLabel.topAnchor.constraint(equalTo: walletNameStackView.bottomAnchor,
                                                    constant: Constants.walletBalanceLabelTopInset),
            walletBalanceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                        constant: Constants.walletBalanceLabelLeadingInset),

            lastChangeTitleLabel.topAnchor.constraint(equalTo: walletBalanceLabel.bottomAnchor,
                                                      constant: Constants.lastChangeTitleLabelTopInset),
            lastChangeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                          constant: Constants.lastChangeTitleLabelLeadingInset),

            lastChangeDateLabel.topAnchor.constraint(equalTo: lastChangeTitleLabel.bottomAnchor,
                                                     constant: Constants.lastChangeDateLabelTopInset),
            lastChangeDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                         constant: Constants.lastChangeDateLabelLeadingInset),
            lastChangeDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                        constant: -Constants.lastChangeDateLabelBottomInset)
        ])
    }

    private func setUpShadows() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 100
        layer.shadowColor = UIColor.white.withAlphaComponent(0.05).cgColor
    }

    private func setUpGradientBackground() {
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.colors = [UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.55).cgColor,
                                UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.15).cgColor]
        layer.addSublayer(gradientLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
    }
}
