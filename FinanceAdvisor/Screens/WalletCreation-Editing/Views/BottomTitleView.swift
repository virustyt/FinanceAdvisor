//
//  TitleView.swift
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

    static let themeColorViewTopInset: CGFloat = UIScreen.main.bounds.height / 34.46
    static let themeColorViewLeadingInset: CGFloat = UIScreen.main.bounds.width / 20.7 // 20
    static let themeColorViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 20.7 // 20
    static let themeColorViewBottomInset: CGFloat = UIScreen.main.bounds.height / 34.46

    static let entierViewBorderLineWidth: CGFloat = 1.5
    static let containerViewBorderLineWidth: CGFloat = 1
    static let cornerRadius: CGFloat = 20
}

class BottomTitleView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel.titleOneLabel
        label.text = LocalizeKeys.colorTheme.localized()
        return label
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private lazy var textFieldForTitle: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.font = R.font.montserratSemiBold(size: 24)
        textField.textColor = .black.withAlphaComponent(0.3)
        textField.text = LocalizeKeys.startHere.localized()
        return textField
    }()

    private let entierViewBackgroundGradientLayer = CAGradientLayer()
    private let entierViewBorderLineGradient = CAGradientLayer()
    private let entierViewBorderLineMaskLayer = CAShapeLayer()

    private let containerViewBackgroundGradientLayer = CAGradientLayer()
    private let containerViewBorderLineColorLayer = CAShapeLayer()
    private let containerViewBorderLineMaskLayer = CAShapeLayer()

    // MARK: - public funcs
    func setWalletTitle(title: String) {
        textFieldForTitle.text = title
    }

    // MARK: - inits
    init() {
        super.init(frame: .zero)
        setUpLayers()
        setUpEntierViewGradient()
        setUpShadows()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs
    private func setUpConstraints() {
        addSubview(titleLabel)
        addSubview(containerView)
        containerView.addSubview(textFieldForTitle)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        textFieldForTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Consts.titleLabelTopInset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Consts.titleLabelLeadingInset),

            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Consts.containerViewTopInset),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Consts.containerViewLeadingInset),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Consts.containerViewTrailingInset),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Consts.containerViewBottomInset),

            textFieldForTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Consts.themeColorViewTopInset),
            textFieldForTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Consts.themeColorViewLeadingInset),
            textFieldForTitle.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Consts.themeColorViewBottomInset)
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

    private func setUpLayers() {
        containerView.layer.cornerRadius = Consts.cornerRadius
        containerView.layer.borderWidth = Consts.containerViewBorderLineWidth
        containerView.layer.borderColor = UIColor.black.cgColor
    }

    private func setUpShadows() {
        layer.cornerRadius = Consts.cornerRadius
        layer.masksToBounds = true
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 100
        layer.shadowColor = UIColor.white.withAlphaComponent(0.05).cgColor

        containerView.layer.masksToBounds = true
        containerView.layer.shadowOffset = CGSize(width: 5, height: 5)
        containerView.layer.shadowRadius = 100
        containerView.layer.shadowColor = UIColor.white.withAlphaComponent(0.05).cgColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if entierViewBackgroundGradientLayer.frame != bounds {
            entierViewBackgroundGradientLayer.frame = bounds

            entierViewBorderLineGradient.frame = bounds
            entierViewBorderLineMaskLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: Consts.cornerRadius).cgPath

            containerViewBorderLineColorLayer.frame = bounds
            containerViewBorderLineMaskLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: Consts.cornerRadius).cgPath
        }
    }
}
