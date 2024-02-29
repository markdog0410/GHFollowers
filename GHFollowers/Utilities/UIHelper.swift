//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/2/29.
//

import UIKit

struct UIHelper {
    
    static func createThreeColumnFlowLayout(view: UIView) -> UICollectionViewFlowLayout{
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWith               = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                   = availableWith / 3
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
