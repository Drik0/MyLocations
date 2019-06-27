//
//  MyTabController.swift
//  MyLocations
//
//  Created by Gerson Costa on 27/06/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import UIKit

class MyTabController: UITabBarController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return nil
    }
}
