//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/2/26.
//

import UIKit
import SafariServices

extension UIViewController {
    
//    重構：
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String){
        
        let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
        
        //        DispatchQueue.main.async {
        //            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
        //            alertVC.modalPresentationStyle = .overFullScreen
        //            alertVC.modalTransitionStyle = .crossDissolve
        //            self.present(alertVC, animated: true)
        //        }
    }
    
    func presentDefaultError() {
        let alertVC = GFAlertVC(alertTitle: "Something Wrong", message: "We're unable to complete your task.", buttonTitle: "OK")
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
