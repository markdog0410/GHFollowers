//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/2/26.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment){
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    private func configure() {
        textColor                   = .secondaryLabel
        font                        = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.7
        lineBreakMode               = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

}
