//
//  Sigil.swift
//  Westeros
//
//  Created by Joaquín Gracia López on 6/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//

import UIKit

final class Sigil {
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String) {
        self.image = image
        self.description = description
    }
}
