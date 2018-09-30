//
//  UIViewController+Navigation .swift
//  Westeros
//
//  Created by Joaquín Gracia López on 12/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController{
        return UINavigationController (rootViewController: self)
    }
}
