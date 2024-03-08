//
//  GFButton.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/2/26.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String){
        self.init(frame: .zero)
//        self.backgroundColor = backgroundColor
//        self.setTitle(title, for: .normal)
        set(color: backgroundColor, title: title)
    }
    
    private func configure() {
        
//      iOS15 內建的按鈕樣式
        configuration = .filled()
        configuration?.cornerStyle = .medium
        
//        layer.cornerRadius = 10
//        setTitleColor(.white, for: .normal)
//        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor, title: String) {
        
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = .white
        configuration?.title = title
        
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
        
//        self.backgroundColor = backgroundColor
//        setTitle(title, for: .normal)
    }
}
