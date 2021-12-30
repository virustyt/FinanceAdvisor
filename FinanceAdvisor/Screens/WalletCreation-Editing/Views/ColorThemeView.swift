//
//  ColorThemeView.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 29.12.2021.
//

import UIKit

fileprivate extension Consts {
    static let titleLabelTopInset: CGFloat = UIScreen.main.bounds.height / 29.86 // 30
    static let titleLabelLeadingInset: CGFloat = UIScreen.main.bounds.width / 13.8 // 30

    static let containerViewTopInset: CGFloat = UIScreen.main.bounds.height / 44.8 // 20
    static let containerViewLeadingInset: CGFloat = UIScreen.main.bounds.width / 13.8 // 30
    static let containerViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 13.8 // 30
    static let containerViewBottomInset: CGFloat = UIScreen.main.bounds.height / 29.86 // 30

    static let themeColorViewTopInset: CGFloat = UIScreen.main.bounds.height / 29.86
    static let themeColorViewLeadingInset: CGFloat = UIScreen.main.bounds.width / 13.8
    static let themeColorViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 51.75
    static let themeColorViewBottomInset: CGFloat = UIScreen.main.bounds.height / 29.86

    static let rightArrowImageViewTopInset: CGFloat = UIScreen.main.bounds.height / 12.48
    static let rightArrowImageViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 17.2
    static let rightArrowImageViewBottomInset: CGFloat = UIScreen.main.bounds.height / 12.48

    static let borderLineWidth: CGFloat = 1.5
    static let cornerRadius: CGFloat = 20
}

class ColorThemeView: UIView {

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

    private lazy var themeColorView: UIView = {
        let view = UIView()
        return view
    }()

    private let backgroundGradientLayer = CAGradientLayer()
    private let borderLineGradient = CAGradientLayer()
    private let borderLineMaskLayer = CAShapeLayer()

    private let containerViewTapClouser: (() -> Void)?

    // MARK: - inits
    init(tapClouser: (() -> Void)? = nil) {
        containerViewTapClouser = tapClouser
        super.init(frame: .zero)
        setUpConstraints()
        setUpGradient()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs
    private func setUpConstraints() {
        addSubview(titleLabel)
        addSubview(containerView)
        containerView.addSubview(themeColorView)
        containerView.addSubview(rightArrowImageView)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        themeColorView.translatesAutoresizingMaskIntoConstraints = false
        rightArrowImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Consts.titleLabelTopInset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Consts.titleLabelLeadingInset),

            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Consts.containerViewTopInset),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Consts.containerViewLeadingInset),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Consts.containerViewTrailingInset),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Consts.containerViewBottomInset),

            themeColorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Consts.themeColorViewTopInset),
            themeColorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Consts.themeColorViewLeadingInset),
            themeColorView.trailingAnchor.constraint(equalTo: rightArrowImageView.leadingAnchor, constant: Consts.themeColorViewTrailingInset),
            themeColorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Consts.themeColorViewBottomInset),

            rightArrowImageView.topAnchor.constraint(equalTo: topAnchor, constant: Consts.rightArrowImageViewTopInset),
            rightArrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Consts.rightArrowImageViewTrailingInset),
            rightArrowImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Consts.rightArrowImageViewBottomInset)
        ])
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

    @objc private func containerViewTapped() {
        containerViewTapClouser?()
    }
}
