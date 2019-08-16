//
//  Ball.swift
//  BallEscape
//
//  Created by nithin muthukumar on 2019-08-14.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import Foundation
import SceneKit
class Ball{
    
    static var skin:SCNMaterial!
    
    var node:SCNNode
    init(_ x:Int,_ z:Int) {
        let sphere=SCNSphere(radius: 0.5)
        node=SCNNode(geometry: sphere)
        node.physicsBody=SCNPhysicsBody(type: .dynamic, shape:SCNPhysicsShape(geometry: sphere,options: nil))
        node.position.x=Float(x)
        node.position.z=Float(z)
        node.position.y=2
    }
    
    
}
