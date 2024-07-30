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
//        let tab2 =
//        let tab3 =
//        let tab4 =
//        let tab5 =
        
        tab1.tabBarItem = UITabBarItem(title: "Pikcer", image: nil, selectedImage: nil)
//        tab2.tabBarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
//        tab3.tabBarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
//        tab4.tabBarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
//        tab5.tabBarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
        
        viewControllers = [tab1]
//                           , tab2, tab3, tab4, tab5]
        
    }
    
    
    
    
    
}
