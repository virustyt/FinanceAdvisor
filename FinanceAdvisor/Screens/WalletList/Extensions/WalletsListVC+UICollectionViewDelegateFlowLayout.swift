//
//  WalletsListVC+UICollectionViewDelegateFlowLayout.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 27.12.2021.
//

import UIKit

extension WalletsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: WalletsListViewController.Constants.cellWidth,
                      height: WalletsListViewController.Constants.cellHeight)
    }
}
