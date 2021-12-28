//
//  WalletsListVC+UICollectionViewDataSource.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 27.12.2021.
//

import UIKit

extension WalletsListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalletCollectionViewCell.reuseIdentifyer, for: indexPath) as? WalletCollectionViewCell
        else {fatalError()}
        
        return cell
    }
}
