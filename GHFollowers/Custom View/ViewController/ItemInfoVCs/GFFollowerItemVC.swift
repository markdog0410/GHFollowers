//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/3/4.
//

import UIKit

protocol GFFollowerItemVCDelegate: AnyObject {
    func didTapGetFollower(for user: User)
}

class GFFollowerItemVC: GFItemInfoVC {
    
    weak var delegate: GFFollowerItemVCDelegate!
    
    init(user: User, delegate: GFFollowerItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(color: .systemGreen, title: "Get Follower")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollower(for: user)
        
    }
}
