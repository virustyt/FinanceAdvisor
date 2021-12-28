//
//  WalletsListVC+UICollectionViewDelegateFlowLayout.swift
//  FinanceAdvisor
//
//  Created by Vladimir Oleinikov on 27.12.2021.
//

import UIKit

extension WalletsListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cellSize()
    }
    
    private func cellSize() -> CGSize{
        if traitCollection.horizontalSizeClass == .regular &&
            traitCollection.verticalSizeClass == .regular {
            return CGSize(width: 380, height: 208)
        } else {
            let cellWidth = UIScreen.main.bounds.width > UIScreen.main.bounds.height ?
                UIScreen.main.bounds.height - Constants.leadingInset - Constants.trailingInset:
                UIScreen.main.bounds.width - Constants.leadingInset - Constants.trailingInset
            let cellHeight:CGFloat = cellWidth * 0.547 > 208 ? cellWidth * 0.547 : 208
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
}
