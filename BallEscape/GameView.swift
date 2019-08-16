//
//  GameView.swift
//  BallEscape
//
//  Created by nithin muthukumar on 2019-08-08.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit
class GameView: SCNView {
    var stick:SKShapeNode!
    var dPad:SKShapeNode!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup2DOverlay()
        
    }
    func setup2DOverlay() {
        let viewHeight = bounds.size.height
        let viewWidth = bounds.size.width
        
        // initiate a sprite kit scene (the actual overlay)
        let sceneSize = CGSize(width: viewWidth, height: viewHeight)
        let skScene = SKScene(size: sceneSize)
        // Modify the SKScene's actual size to exactly match the SKView.
        skScene.scaleMode = .resizeFill
        
        dPad = SKShapeNode(circleOfRadius: 50)
        dPad.strokeColor = .white
        
        dPad.lineWidth = 1
        
        stick=SKShapeNode(circleOfRadius: 5)
        stick.strokeColor = .white
        stick.lineWidth=1
        
        
        // the position is initially at (0, 375) of the views coordinate system
        // the `position` of the dpadShape is at the middle of the shape
        // this is why we put it by the half of its width to the right
        // with a little offset/margin of 10. Same for the height.
        dPad.position.x = dPad.frame.size.width / 2 + 10
        dPad.position.y = dPad.frame.size.height / 2 + 10
        stick.position=dPad.position
        
        // add the dpad shape to the sprite kit scene
        skScene.addChild(dPad)
        skScene.addChild(stick)
        
        // disables skScene to receive touch
        // so it goes through this layer
        // which means to our GameView scene
        skScene.isUserInteractionEnabled = false
        
        // assign the sprite kit scene to the scene kit view.
        overlaySKScene = skScene
        
    }
    
    func virtualDPad() -> CGRect {
        var vDPad = CGRect(x: 0, y: 0, width: 150, height: 150)
        vDPad.origin.y = bounds.size.height - vDPad.size.height - 10
        vDPad.origin.x = 10
        return vDPad
    }

}
