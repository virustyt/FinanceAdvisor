//
//  AddWalletCollectionViewCell.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 27.12.2021.
//

import UIKit

class AddWalletButton: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel.titleOneLabel
        label.text = "Wallets"
        return label
    }()

    private lazy var plusImageView: UIImageView = {
        let image = R.image.add()
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let gradientLayer = CAGradientLayer()
    
    //MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear.withAlphaComponent(0)
        
        setUpGradientBackground()
        setUpShadows()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - private funcs
    private func setUpConstraints(){
        addSubview(titleLabel)
        addSubview(plusImageView)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),

            plusImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            plusImageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30)
        ])
    }
    
    private func setUpShadows(){
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 100
        layer.shadowColor = UIColor.white.withAlphaComponent(0.05).cgColor
    }
    
    private func setUpGradientBackground(){
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
