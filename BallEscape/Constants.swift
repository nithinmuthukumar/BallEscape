//
//  Constants.swift
//  BallEscape
//
//  Created by nithin muthukumar on 2019-08-06.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import Foundation
enum Objects:Int{
    case FLOOR,WALL,PLAYER,ENEMY
}
class Constants{
    static let levels:[([[Int]],(Int,Int))]=[
        ([
            [1,1,1,1,1,0,1,1,1,1],
            [1,0,0,0,0,0,0,0,0,1],
            [1,1,0,1,1,0,1,1,1,1],
            [0,1,0,1,0,0,1,1,0,1],
            [1,0,0,1,0,1,1,1,1,1],
            [1,1,0,1,1,1,1,0,0,1],
            [1,1,0,0,1,0,0,0,0,1],
            [1,1,1,0,0,0,1,0,1,1],
            [1,1,1,0,1,1,1,1,1,1],
            [1,1,1,1,1,1,1,1,1,1]
        ],(-1,4))
    ]
    
    
}
