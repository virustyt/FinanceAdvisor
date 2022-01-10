//
//  ColorThemeCollectionViewCell.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 02.01.2022.
//

import UIKit

fileprivate extension Consts {
    static let colorImageViewTopInset: CGFloat = UIScreen.main.bounds.height / 30 // 30
    static let colorImageViewLeadingInset: CGFloat = UIScreen.main.bounds.width / 16.5 // 25
    static let colorImageViewTrailingInset: CGFloat = UIScreen.main.bounds.width / 16.5 // 25
    static let colorImageViewBottomInset: CGFloat = UIScreen.main.bounds.height / 30 // 30

    static let borderLineWidth: CGFloat = 1.5
    static let cornerRadius: CGFloat = 20

    static let shadowRadius: CGFloat = 100
    static let shadowOFfset: CGSize = CGSize(width: 5, height: 5)
}

class ColorThemeCollectionViewCell: UICollectionViewCell {

    static let identifyer = String(describing: self)

    private let colorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private let backgroundGradientLayer = CAGradientLayer()
    private let borderLineGradient = CAGradientLayer()
    private let borderLineMaskLayer = CAShapeLayer()

    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear.withAlphaComponent(0)
        setUpShadows()
        setUpGradient()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - public funcs
    func setColorTheme(to colorTheme: ColorTheme) {
        colorImageView.image = colorTheme.themeImage
    }

    // MARK: - private funcs
    private func setUpConstraints() {
        contentView.addSubview(colorImageView)

        colorImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Consts.colorImageViewTopInset),
            colorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Consts.colorImageViewLeadingInset),
            colorImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Consts.colorImageViewTrailingInset),
            colorImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Consts.colorImageViewBottomInset)
        ])
    }

    private func setUpShadows() {
        layer.cornerRadius = Consts.cornerRadius
        layer.masksToBounds = true
        layer.shadowOffset = Consts.shadowOFfset
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
