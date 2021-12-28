//
//  WalletsListViewController.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 27.12.2021.
//

import UIKit

enum Constants {
    static let leadingInset: CGFloat = 20
    static let trailingInset: CGFloat = 20
}

class WalletsListViewController: UIViewController {
    
    private lazy var emptyCollectionViewLabel: UILabel = {
        let label = UILabel.titleOneLabel
        label.text = "No wallets created 😥"
        label.isHidden = true
        return label
    }()
    
    private lazy var addWalletButton: UIView = {
        let button = AddWalletButton()
        return button
    }()
    
    private let backgroundGradientView = UIImageView(image: R.image.backGradientTwo())

    private lazy var collectinView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WalletCollectionViewCell.self, forCellWithReuseIdentifier: WalletCollectionViewCell.reuseIdentifyer)
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        return collectionView
    }()
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraints()
    }
    
    //MARK: - life cycle
    override func viewWillLayoutSubviews() {
        //if model is empty, unhide emptyCollectionViewLabel
    }
    
    //MARK: - private funcs
    private func setUpConstraints(){
        view.addSubview(backgroundGradientView)
        view.addSubview(collectinView)
        view.addSubview(addWalletButton)
        view.addSubview(emptyCollectionViewLabel)
        
        collectinView.translatesAutoresizingMaskIntoConstraints = false
        addWalletButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        emptyCollectionViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundGradientView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundGradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundGradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundGradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addWalletButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 75.75),
            addWalletButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: Constants.leadingInset),
            addWalletButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -Constants.trailingInset),
            addWalletButton.heightAnchor.constraint(equalToConstant: addButtonHeight()),
            
            collectinView.topAnchor.constraint(equalTo: addWalletButton.bottomAnchor,constant: 40),
            collectinView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: Constants.leadingInset),
            collectinView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -Constants.trailingInset),
            collectinView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyCollectionViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyCollectionViewLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func addButtonHeight() -> CGFloat {
        let lowestSideOfScreen = UIScreen.main.bounds.width > UIScreen.main.bounds.height ?
            UIScreen.main.bounds.height:
            UIScreen.main.bounds.width
        return lowestSideOfScreen * 0.18
    }
}


