//
//  Floor.swift
//  BallEscape
//
//  Created by nithin muthukumar on 2019-08-14.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import Foundation
import SceneKit
class Floor{
    
    var node=SCNNode()
    var cubes=[[SCNNode]]()
    
    init(_ size:Int) {
        for z in 1...size{
            cubes.append([])
            for x in 1...size{
                let cube=createCube(x-size/2,z-size/2)
                node.addChildNode(cube)
                cubes[z-1].append(cube)
                
                
                
            }
        }
        
        
        
    }
    func createCube(_ x:Int,_ z:Int)->SCNNode{
        let shape=SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        let cube=SCNNode(geometry:shape )
        
        cube.physicsBody=SCNPhysicsBody(type: .kinematic, shape: SCNPhysicsShape(geometry: shape, options:nil))
        cube.position.x=Float(x)
        cube.position.z=Float(z)
        return cube
        
        
    }
    func setLevel(_ level:[[Objects]] ){
        for (r,row) in level.enumerated(){
            for (c,spot) in row.enumerated(){
                
                switch(spot){
                case .FLOOR:
                    
                    cubes[r][c].position.y = 0
                    cubes[r][c].geometry?.firstMaterial?.diffuse.contents=UIColor.white
                case .WALL:
                    cubes[r][c].position.y=1;
                    cubes[r][c].geometry?.firstMaterial?.diffuse.contents=UIColor.black
                case .PLAYER:
                    break;
                case .ENEMY:
                    break;
                }
            }
        }
        
    }
    func setLevel(_ level:[[Int]]) {
        setLevel(level.map{$0.map{Objects(rawValue: $0)!}})
    }
}
