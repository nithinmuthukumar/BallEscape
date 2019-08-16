//
//  GameViewController.swift
//  BallEscape
//
//  Created by nithin muthukumar on 2019-08-05.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit
import CoreMotion

class GameViewController: UIViewController {
    var touch:UITouch!
    var floor:Floor!
    var levelGenerator=LevelGenerator(size:20)
    var ball:Ball!
    let motionManager=CMMotionManager()
    var gameView: GameView {
        return view as! GameView
    }
    var scene: SCNScene!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        scene = SCNScene(named: "art.scnassets/scene.scn")
        gameView.scene = scene
        scene.background.contents = UIColor.blue
        scene.physicsWorld.contactDelegate=self
        
        gameView.delegate = self
        
        gameView.isPlaying = true
        //guard motionManager.isDeviceMotionAvailable else{
         //   fatalError("Device motion is not available")
        //}
        
        
        
        // retrieve the ship node
        
        floor = Floor(10)
        let (level,start)=levelGenerator.generate()
        
        floor.setLevel(Constants.levels[0].0)
        ball = Ball(Constants.levels[0].1.0,Constants.levels[0].1.1)
        
        
        scene.rootNode.addChildNode(ball.node)
        scene.rootNode.addChildNode(floor.node)
        
        
        
        
        // retrieve the SCNView
        
        //gameView.debugOptions = [.showPhysicsShapes]
        // set the scene to the view
        gameView.scene = scene
        // show statistics such as fps and timing information
        //gameView.showsStatistics = true
    
        
        
    
    
        
        /*
        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: {
            data , error in
            
            guard let data = data else { return }
            
            //let attitude: CMAttitude = data.attitude
            //floor.eulerAngles = SCNVector3Make(Float(attitude.roll), Float(attitude.yaw), Float(attitude.pitch))
            
        })
 */
        
    }
    
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .all
        }
    }
    
}
extension GameViewController {
    
    
    // store touch in global scope
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touch=touches.first
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if touch == touches.first {
            if gameView.virtualDPad().contains(touch.location(in: gameView)){
                let touchLocation=touch.location(in: gameView)
                gameView.stick.position=touch.location(in:gameView.overlaySKScene! )
                let middleOfCircleX = gameView.virtualDPad().origin.x + 75
                let middleOfCircleY = gameView.virtualDPad().origin.y + 75
                let lengthOfX = Float(middleOfCircleX-touchLocation.x)
                let lengthOfY = Float(middleOfCircleY-touchLocation.y )
                floor.node.runAction(SCNAction.rotateTo(x:CGFloat(-lengthOfY)/200 , y: 0, z: CGFloat(lengthOfX)/200, duration: 0.5,usesShortestUnitArc: true))
                
            }
            
            
            
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        floor.node.runAction(SCNAction.rotateTo(x:0 , y: 0, z: 0, duration: 0.7,usesShortestUnitArc: true))
        gameView.stick.position.x=0
        gameView.stick.position.y=0
    }
}

extension GameViewController:
SCNSceneRendererDelegate {
    
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
        
        
        
        
        
        
        
        
    }
    
}
extension GameViewController:SCNPhysicsContactDelegate{
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        
    }
}
