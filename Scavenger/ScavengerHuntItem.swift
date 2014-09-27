//
//  ScavengerHuntItem.swift
//  Scavenger
//
//  Created by Xinyun (Victor) Zhao on 9/23/14.
//  Copyright (c) 2014 Xinyun (Victor) Zhao. All rights reserved.
//

import UIKit

class ScavengerHuntItem: NSObject {
    let name: String
    var photo: UIImage?
    var isComplete: Bool {
        get{
            return photo != nil
        }
    }
    init(name: String){
      self.name = name
    }
    
}
