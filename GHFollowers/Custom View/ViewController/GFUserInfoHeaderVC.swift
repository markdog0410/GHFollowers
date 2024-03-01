//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/3/1.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {

    let avatarImageView   = GFAvatarImageView(frame: .zero)
    let usernamLabel      = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel         = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel     = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel          = GFBodyLabel(textAlignment: .left)
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
