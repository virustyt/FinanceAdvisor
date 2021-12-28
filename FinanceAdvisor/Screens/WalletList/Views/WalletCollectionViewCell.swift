//
//  WalletCollectionViewCell.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 27.12.2021.
//

import UIKit
import Localize_Swift

class WalletCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifyer = String(describing: self)
    
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
        label.text = "last-change".localized()
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
        let stack = UIStackView(arrangedSubviews: [walletNameLabel,rightArrowImageView])
        stack.distribution = .fill
        walletNameLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        rightArrowImageView.setContentHuggingPriority(.required, for: .horizontal)
        stack.axis = .horizontal
        stack.alignment = .top
        stack.spacing = 25
        return stack
    }()
    
    //MARK: - inits
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
    
    //MARK: - private funcs
    private func setUpConstraints(){
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
            
            widthAnchor.constraint(equalToConstant: cellWidth()),
            
            walletNameStackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            walletNameStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            walletNameStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -35),
            
            walletBalanceLabel.topAnchor.constraint(equalTo: walletNameStackView.bottomAnchor,constant: 30),
            walletBalanceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            
            
            lastChangeTitleLabel.topAnchor.constraint(equalTo: walletBalanceLabel.bottomAnchor,constant: 40),
            lastChangeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            
            lastChangeDateLabel.topAnchor.constraint(equalTo: lastChangeTitleLabel.bottomAnchor,constant: 10),
            lastChangeDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            lastChangeDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20)
        ])
    }
    
    private func cellWidth() -> CGFloat{
        if traitCollection.horizontalSizeClass == .regular &&
            traitCollection.verticalSizeClass == .regular {
            return 308
        } else {
            let cellWidth = UIScreen.main.bounds.width > UIScreen.main.bounds.height ?
                UIScreen.main.bounds.height - Constants.leadingInset - Constants.trailingInset:
                UIScreen.main.bounds.width - Constants.leadingInset - Constants.trailingInset
            
            return cellWidth
        }
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
