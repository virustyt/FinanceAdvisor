//
//  CurrencyListCollectionViewCell.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 07.01.2022.
//

import UIKit

extension Consts {
    static let currencyNameLabelTopInset: CGFloat = UIScreen.main.bounds.height / 33.18 // 25
    static let currencyNameLabelBottomInset: CGFloat = UIScreen.main.bounds.height / 33.18 // 25
    static let currencyNameLabelLeadingInset: CGFloat = UIScreen.main.bounds.width / 13.8 // 30

    static let currencyCodeLabelTopInset: CGFloat = UIScreen.main.bounds.height / 33.18
    static let currencyCodeLabelBottomInset: CGFloat = UIScreen.main.bounds.height / 33.18
    static let currencyCodeLabelLeadingInset: CGFloat = UIScreen.main.bounds.width / 13.8
    static let currencyCodeLabelTrailingInset: CGFloat = UIScreen.main.bounds.width / 13.8

    static let borderLineWidth: CGFloat = 1.5
    static let cornerRadius: CGFloat = 16
    static let shadowRadius: CGFloat = 163.6
}

class CurrencyListCollectionViewCell: UICollectionViewCell {

    static let identifyer = String(describing: self)

    private let backgroundGradientLayer = CAGradientLayer()
    private let borderLineGradient = CAGradientLayer()
    private let borderLineMaskLayer = CAShapeLayer()

    private lazy var currencyNameLabel: UILabel = {
        let label = UILabel.titleOneLabel
        label.numberOfLines = 0
        return label
    }()

    private lazy var currencyCodeLabel: UILabel = {
        let label = UILabel.titleOneLabel
        return label
    }()

    // MARK: - public funcs
    func setCellsCurrency(to currency: Currency) {
        currencyNameLabel.text = currency.name
        currencyCodeLabel.text = currency.code
    }

    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear.withAlphaComponent(0)
        setUpShadows()
        setUpGradient()
        setUpConstrainst()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs
    private func setUpConstrainst() {
        contentView.addSubview(currencyCodeLabel)
        contentView.addSubview(currencyNameLabel)

        currencyCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyNameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            currencyNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Consts.currencyNameLabelTopInset),
            currencyNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Consts.currencyNameLabelBottomInset),
            currencyNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Consts.currencyNameLabelLeadingInset),

            currencyCodeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Consts.currencyCodeLabelTopInset),
            currencyCodeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Consts.currencyCodeLabelBottomInset),
            currencyCodeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: currencyNameLabel.trailingAnchor,
                                                       constant: Consts.currencyNameLabelLeadingInset),
            currencyCodeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                        constant: -Consts.currencyCodeLabelTrailingInset)
        ])
    }

    private func setUpShadows() {
        layer.cornerRadius = Consts.cornerRadius
        layer.masksToBounds = true
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = Consts.shadowRadius
        layer.shadowColor = UIColor.white.withAlphaComponent(0.05).cgColor
    }

    private func setUpGradient() {
        backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        backgroundGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        backgroundGradientLayer.colors = [UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.55).cgColor,
                                          UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.15).cgColor]

        borderLineGradient.startPoint = CGPoint(x: 0, y: 0.5)
        borderLineGradient.endPoint = CGPoint(x: 1, y: 0.5)
        borderLineGradient.colors = [UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.4).cgColor,
                                     UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.15).cgColor]
        borderLineMaskLayer.lineWidth = Consts.borderLineWidth
        borderLineMaskLayer.fillColor = nil
        borderLineMaskLayer.strokeColor = UIColor.black.cgColor
        borderLineGradient.mask = borderLineMaskLayer

        layer.addSublayer(borderLineGradient)
        layer.addSublayer(backgroundGradientLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if backgroundGradientLayer.frame != bounds {
            backgroundGradientLayer.frame = bounds
            borderLineGradient.frame = bounds
            borderLineMaskLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: Consts.cornerRadius).cgPath
        }
    }
}
