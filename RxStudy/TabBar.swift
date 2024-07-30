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
        
        let tab1 = PickerViewController()
        let tab2 = TableViewViewController()
        let tab3 = TextFieldViewController()
        
        tab1.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "figure.outdoor.cycle"), selectedImage: nil)
        tab2.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "figure.archery"), selectedImage: nil)
        tab3.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "figure.open.water.swim"), selectedImage: nil)
        
        viewControllers = [tab1, tab2, tab3]
        
    }
    
}
