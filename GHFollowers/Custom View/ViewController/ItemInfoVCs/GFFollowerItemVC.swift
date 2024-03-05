//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/3/4.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Follower")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollower(for: user)
        
    }
}
