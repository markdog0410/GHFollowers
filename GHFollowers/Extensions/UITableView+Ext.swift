//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/3/7.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
