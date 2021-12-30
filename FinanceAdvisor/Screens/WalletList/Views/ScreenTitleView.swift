//
//  AddOrEditNewWalletView.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 29.12.2021.
//

import UIKit
import Localize_Swift

extension Consts {
    static let backImageViewTopInset: CGFloat = UIScreen.main.bounds.height / 49.77
    static let backImageViewLeadingInset: CGFloat = UIScreen.main.bounds.width / 13.8
    static let backImageViewBottomInset: CGFloat = UIScreen.main.bounds.height / 49.77

    static let titleLabelLeadingInset: CGFloat = UIScreen.main.bounds.width / 23
    static let titleLabelTrailingInset: CGFloat = UIScreen.main.bounds.width / 23

    static let deleteWalletButtonTopInset: CGFloat = UIScreen.main.bounds.height / 49.77
    static let deleteWalletButtonTrailingInset: CGFloat = UIScreen.main.bounds.width / 13.8
    static let deleteWalletButtonBottomInset: CGFloat = UIScreen.main.bounds.height / 49.77

    static let borderLineWidth: CGFloat = 1.5
    static let cornerRadius: CGFloat = 20
}

class ScreenTitleView: UIView {

    private var title: String

    private var rightButtonImage: UIImage?
    private var rightButtonTappedClouser: (() -> Void)?

    private var leftButtonImage: UIImage?
    private var leftButtonTappedClouser: (() -> Void)?

    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setImage(rightButtonImage, for: .normal)
        button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        button.isHidden = rightButtonImage == nil ? true : false
        return button
    }()

    private lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setImage(leftButtonImage, for: .normal)
        button.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        button.isHidden = leftButtonImage == nil ? true : false
        return button
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel.titleOneLabel
        label.text = title
        return label
    }()

    private let backgroundGradientLayer = CAGradientLayer()
    private let borderLineGradient = CAGradientLayer()
    private let borderLineMaskLayer = CAShapeLayer()

    // MARK: - inits
    @objc init(title: String,
               rightButtonImage: UIImage? = nil,
               rightButtonTapClouser: (() -> Void)? = nil,
               leftButtonImage: UIImage? = nil,
               leftButtonTapClouser: (() -> Void)? = nil) {
        self.title = title
        self.rightButtonImage = rightButtonImage
        self.rightButtonTappedClouser = rightButtonTapClouser

        self.leftButtonImage = leftButtonImage
        self.leftButtonTappedClouser = leftButtonTapClouser

        super.init(frame: .zero)

        backgroundColor = .clear.withAlphaComponent(0)
        setUpShadows()
        setUpGradient()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs
    private func setUpConstraints() {
        addSubview(rightButton)
        addSubview(leftButton)
        addSubview(titleLabel)

        rightButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightButton.topAnchor.constraint(equalTo: topAnchor, constant: Consts.backImageViewTopInset),
            rightButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Consts.backImageViewBottomInset),
            rightButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Consts.backImageViewLeadingInset),
            rightButton.widthAnchor.constraint(equalTo: rightButton.heightAnchor),

            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            leftButton.topAnchor.constraint(equalTo: topAnchor, constant: Consts.deleteWalletButtonTopInset),
            leftButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Consts.deleteWalletButtonBottomInset),
            leftButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Consts.deleteWalletButtonTrailingInset),
            leftButton.widthAnchor.constraint(equalTo: leftButton.heightAnchor)
        ])

        if rightButton.isHidden == true {
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: Consts.backImageViewLeadingInset).isActive = true
        } else {
            titleLabel.leadingAnchor.constraint(equalTo: rightButton.trailingAnchor,
                                                constant: Consts.titleLabelLeadingInset).isActive = true
        }

        if leftButton.isHidden == true {
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -Consts.deleteWalletButtonTrailingInset).isActive = true
        } else {
            titleLabel.trailingAnchor.constraint(equalTo: leftButton.leadingAnchor,
                                                 constant: Consts.titleLabelTrailingInset).isActive = true
        }
    }

    private func setUpShadows() {
        layer.cornerRadius = Consts.cornerRadius
        layer.masksToBounds = true
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 100
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

    @objc private func rightButtonTapped() {
        if rightButtonTappedClouser != nil {
            rightButtonTappedClouser!()
        }
    }

    @objc private func leftButtonTapped() {
        if leftButtonTappedClouser != nil {
            leftButtonTappedClouser!()
        }
    }
}
