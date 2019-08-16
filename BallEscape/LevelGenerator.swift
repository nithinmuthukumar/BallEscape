//
//  LevelGenerator.swift
//  BallEscape
//
//  Created by nithin muthukumar on 2019-08-06.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import Foundation
import SceneKit
class LevelGenerator{
    
    var size:Int
    init(size:Int=20){
        self.size=size
        
        
        
        
        
        
    }
    func generate()->([[Objects]],(Int,Int)){
        var grid=[[Objects]]()
        for y in 0..<size{
            grid.append([])
            for _ in 1...size{
                grid[y].append( [Objects.WALL,Objects.FLOOR,Objects.FLOOR,Objects.FLOOR].randomElement()!)
            }
        }
        var ballPos:(Int,Int)?=nil
        while ballPos==nil{
            var x=Int.random(in: 0..<size)
            var z=Int.random(in: 0..<size)
            if grid[z][x]==Objects.FLOOR{
                ballPos=(x,z)
            }
            
        }
        return (grid,ballPos!)
        
    }
        

    func addLevel(num:Int) {
        
        
        
        
        
    }
}

