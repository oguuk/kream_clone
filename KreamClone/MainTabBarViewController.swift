//
//  MainTabBarViewController.swift
//  KreamClone
//
//  Created by 오국원 on 2022/05/20.
//

import UIKit

class MainTabBarViewController:UITabBarController {
    //MARK: -Properties
    let vc1 = UINavigationController(rootViewController: HomeViewController())
    let vc2 = UINavigationController(rootViewController: StyleViewController())
    let vc3 = UINavigationController(rootViewController: ShopViewController())
    let vc4 = UINavigationController(rootViewController: WatchViewController())
    let vc5 = UINavigationController(rootViewController: MyViewController())
    
    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        UIconfigure()
    }
    
    //MARK: - Helpers
    func UIconfigure() {
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.title = "Home"
        
        vc2.tabBarItem.image = UIImage(systemName: "text.badge.star")
        vc2.title = "Style"
        
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.title = "Shop"
        
        vc4.tabBarItem.image = UIImage(systemName: "arrowtriangle.right.square")
        vc4.title = "Watch"
        
        vc5.tabBarItem.image = UIImage(systemName: "person")
        vc5.title = "My"
        
        setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)
    }
}
