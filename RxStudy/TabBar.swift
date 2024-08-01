//
//  TabBar.swift
//  RxStudy
//
//  Created by J Oh on 7/30/24.
//

import UIKit

final class TabBar: UITabBarController {
    
    let vc1 = PickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tab1 = UINavigationController(rootViewController: PickerViewController())
        let tab2 = UINavigationController(rootViewController: TableViewViewController())
        let tab3 = UINavigationController(rootViewController: TextFieldViewController())
        let tab4 = UINavigationController(rootViewController: Numbers())
        
        tab1.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "figure.outdoor.cycle"), selectedImage: nil)
        tab2.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "figure.archery"), selectedImage: nil)
        tab3.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "figure.open.water.swim"), selectedImage: nil)
        tab4.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "plus"), selectedImage: nil)
        
        viewControllers = [tab1, tab2, tab3, tab4]
        
    }
    
}
