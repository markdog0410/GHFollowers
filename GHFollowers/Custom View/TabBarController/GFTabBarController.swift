//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/3/6.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNC(), createFavoritesNC()]
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesListVC = FavoritesListVC()
        favoritesListVC.title = "FavoritesList"
        favoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesListVC)
    }
    
//    func createTabbar() -> UITabBarController {
//        let tabbar = UITabBarController()
//        
//
//        let tabbarAppearence = UITabBarAppearance()
//        tabbarAppearence.backgroundColor = .systemBackground
//        UITabBar.appearance().scrollEdgeAppearance = tabbarAppearence
//
//        
//        return tabbar
//    }

}
