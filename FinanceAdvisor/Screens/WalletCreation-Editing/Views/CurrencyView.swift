//
//  CurrencyView.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 29.12.2021.
//

import UIKit

fileprivate extension Consts {
    static let titleLabelTopInset: CGFloat = UIScreen.main.bounds.height / 44.8 // 20
    static let titleLabelLeadingInset: CGFloat = UIScreen.main.bounds.width / 20.7 // 20

    static let containerViewTopInset: CGFloat = UIScreen.main.bounds.height / 44.8 // 20
    static let containerViewLeadingInset: CGFloat = UIScreen.main.bounds.width / 20.7 // 20
    static let containerViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 20.7 // 20
    static let containerViewBottomInset: CGFloat = UIScreen.main.bounds.height / 44.8 // 20

    static let themeColorViewTopInset: CGFloat = UIScreen.main.bounds.height / 29.86
    static let themeColorViewLeadingInset: CGFloat = UIScreen.main.bounds.width / 13.8
    static let themeColorViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 51.75
    static let themeColorViewBottomInset: CGFloat = UIScreen.main.bounds.height / 29.86

    static let rightArrowImageViewTopInset: CGFloat = UIScreen.main.bounds.height / 12.48
    static let rightArrowImageViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 17.2
    static let rightArrowImageViewBottomInset: CGFloat = UIScreen.main.bounds.height / 12.48

    static let entierViewBorderLineWidth: CGFloat = 1.5
    static let containerViewBorderLineWidth: CGFloat = 1.5
    static let cornerRadius: CGFloat = 20
}

class CurrencyView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel.titleOneLabel
        label.text = LocalizeKeys.colorTheme.localized()
        return label
    }()

    private let rightArrowImageView = UIImageView(image: R.image.arrowRight())

    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var walletCurrencyLabel: UILabel = {
        let label = UILabel.titleOneLabel
        label.text = "USD $"
        label.textAlignment = .left
        return label
    }()

    private let entierViewBackgroundGradientLayer = CAGradientLayer()
    private let entierViewBorderLineGradient = CAGradientLayer()
    private let entierViewBorderLineMaskLayer = CAShapeLayer()

    private let containerViewBackgroundGradientLayer = CAGradientLayer()
    private let containerViewBorderLineGradient = CAGradientLayer()
    private let containerViewBorderLineMaskLayer = CAShapeLayer()

    private let containerViewTapClouser: (() -> Void)?

    // MARK: - public funcs
    func setCurrency(code: String) {
        walletCurrencyLabel.text = code
    }

    // MARK: - inits
    init(tapClouser: (() -> Void)? = nil) {
        containerViewTapClouser = tapClouser
        super.init(frame: .zero)
        setUpConstraints()
        setUpEntierViewGradient()
        setUpContainerViewGradient()
        setUpShadows()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs
    private func setUpConstraints() {
        addSubview(titleLabel)
        addSubview(containerView)
        containerView.addSubview(walletCurrencyLabel)
        containerView.addSubview(rightArrowImageView)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        walletCurrencyLabel.translatesAutoresizingMaskIntoConstraints = false
        rightArrowImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Consts.titleLabelTopInset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Consts.titleLabelLeadingInset),

            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Consts.containerViewTopInset),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Consts.containerViewLeadingInset),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Consts.containerViewTrailingInset),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Consts.containerViewBottomInset),

            walletCurrencyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Consts.themeColorViewTopInset),
            walletCurrencyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Consts.themeColorViewLeadingInset),
            walletCurrencyLabel.trailingAnchor.constraint(equalTo: rightArrowImageView.leadingAnchor, constant: Consts.themeColorViewTrailingInset),
            walletCurrencyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Consts.themeColorViewBottomInset),

            rightArrowImageView.topAnchor.constraint(equalTo: topAnchor, constant: Consts.rightArrowImageViewTopInset),
            rightArrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Consts.rightArrowImageViewTrailingInset),
            rightArrowImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Consts.rightArrowImageViewBottomInset)
        ])
    }

    private func setUpEntierViewGradient() {
        entierViewBackgroundGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        entierViewBackgroundGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        entierViewBackgroundGradientLayer.colors = [UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.55).cgColor,
                                UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.15).cgColor]

        entierViewBorderLineGradient.startPoint = CGPoint(x: 0, y: 0.5)
        entierViewBorderLineGradient.endPoint = CGPoint(x: 1, y: 0.5)
        entierViewBorderLineGradient.colors = [UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.4).cgColor,
                                UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.15).cgColor]
        entierViewBorderLineMaskLayer.lineWidth = Consts.entierViewBorderLineWidth
        entierViewBorderLineMaskLayer.fillColor = nil
        entierViewBorderLineMaskLayer.strokeColor = UIColor.black.cgColor
        entierViewBorderLineGradient.mask = entierViewBorderLineMaskLayer

        layer.addSublayer(entierViewBorderLineGradient)
        layer.addSublayer(entierViewBackgroundGradientLayer)
    }

    private func setUpContainerViewGradient() {
        containerViewBackgroundGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        containerViewBackgroundGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        containerViewBackgroundGradientLayer.colors = [UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.55).cgColor,
                                                       UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.15).cgColor]

        containerViewBorderLineGradient.startPoint = CGPoint(x: 0, y: 0.5)
        containerViewBorderLineGradient.endPoint = CGPoint(x: 1, y: 0.5)
        containerViewBorderLineGradient.colors = [UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.4).cgColor,
                                                  UIColor(red: 1, green: 1, blue: 0.984, alpha: 0.15).cgColor]
        containerViewBorderLineMaskLayer.lineWidth = Consts.containerViewBorderLineWidth
        containerViewBorderLineMaskLayer.fillColor = nil
        containerViewBorderLineMaskLayer.strokeColor = UIColor.black.cgColor
        containerViewBorderLineGradient.mask = containerViewBorderLineMaskLayer

        containerView.layer.addSublayer(containerViewBorderLineGradient)
        containerView.layer.addSublayer(containerViewBackgroundGradientLayer)
    }

    private func setUpShadows() {
        layer.cornerRadius = Consts.cornerRadius
        layer.masksToBounds = true
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 100
        layer.shadowColor = UIColor.white.withAlphaComponent(0.05).cgColor

        containerView.layer.cornerRadius = Consts.cornerRadius
        containerView.layer.masksToBounds = true
        containerView.layer.shadowOffset = CGSize(width: 5, height: 5)
        containerView.layer.shadowRadius = 100
        containerView.layer.shadowColor = UIColor.white.withAlphaComponent(0.05).cgColor
    }


    @objc private func containerViewTapped() {
        containerViewTapClouser?()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if entierViewBackgroundGradientLayer.frame != bounds {
            entierViewBackgroundGradientLayer.frame = bounds

            entierViewBorderLineGradient.frame = bounds
            entierViewBorderLineMaskLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: Consts.cornerRadius).cgPath

            containerViewBackgroundGradientLayer.frame = bounds

            containerViewBorderLineGradient.frame = bounds
            containerViewBorderLineMaskLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: Consts.cornerRadius).cgPath
        }
    }
}
