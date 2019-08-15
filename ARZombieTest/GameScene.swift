//
//  Scene.swift
//  ARSpriteKit
//
//  Created by Esteban Herrera on 7/4/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import SpriteKit
import ARKit

class GameScene: SKScene {
    
   
    var sceneView: ARSKView {
        return view as! ARSKView
    }
    
    //---------------------------------
    // Flags
    //---------------------------------
    
    var night: Bool! = false;
    var blind: Bool! = false;
    
    
   //Button
    let exitbtn:SKSpriteNode = SKSpriteNode(imageNamed:"exitbtn")
    
    
    
    //Sound
    let killSound = SKAction.playSoundFileNamed("ghost", waitForCompletion: false)
    
    //---------------------------
    // variables
    //---------------------------
    
    
     var creationTime : TimeInterval = 0
     let ghostsLabel = SKLabelNode(text: "Zombies")
     let numberOfGhostsLabel = SKLabelNode(text: "0")
    
    var ghostCount = 0 {
        didSet{
            self.numberOfGhostsLabel.text = "\(ghostCount)"
        }
    }
    
    
    //Characters
    var sight: SKSpriteNode!
    
    
    
    override func didMove(to view: SKView) {
        
        let nightvision:SKSpriteNode = SKSpriteNode(imageNamed:"night")
        nightvision.name = "nightvision"
        
          exitbtn.position = CGPoint(x:300, y:550)
          addChild(exitbtn)
        
        nightvision.position = CGPoint(x:70, y:550)
        addChild(nightvision)
        
        
        ghostsLabel.fontSize = 20
        ghostsLabel.fontName = "DevanagariSangamMN-Bold"
        ghostsLabel.color = .white
        ghostsLabel.position = CGPoint(x: 60, y: 50)
        
        addChild(ghostsLabel)
        
        numberOfGhostsLabel.fontSize = 20
        numberOfGhostsLabel.fontName = "DevanagariSangamMN-Bold"
        numberOfGhostsLabel.color = .white
        numberOfGhostsLabel.position = CGPoint(x: 50, y: 15)
        addChild(numberOfGhostsLabel)
        
        createZombieAnchor()
        
        sight = SKSpriteNode(imageNamed: "sight")
        addChild(sight)
      
        
    }
    
    
    func randomFloat(min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
    
   
    
    func createZombieAnchor(){
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        // Define 360º in radians
        let _360degrees = 2.0 * Float.pi
        
        // Create a rotation matrix in the X-axis
        let rotateX = simd_float4x4(SCNMatrix4MakeRotation(_360degrees * randomFloat(min: 0.0, max: 1.0), 1, 0, 0))

        // Create a rotation matrix in the Y-axis
        let rotateY = simd_float4x4(SCNMatrix4MakeRotation(_360degrees * randomFloat(min: 0.0, max: 1.0), 0, 1, 0))

        // Combine both rotation matrices
        let rotation = simd_mul(rotateX, rotateY)

        // Create a translation matrix in the Z-axis with a value between 1 and 2 meters
        var translation = matrix_identity_float4x4
       // translation.columns.3.z = -1 - randomFloat(min: 0.0, max: 1.0)
        translation.columns.3.z = -0.3

        // Combine the rotation and translation matrices
        let transform = simd_mul(rotation, translation)

        // Create an anchor
        let anchor = ARAnchor(transform: transform)

        // Add the anchor
        sceneView.session.add(anchor: anchor)
        
        // Increment the counter
        ghostCount += 1
        
    }
    
    
    //--------------------------------------------------------------
    // MARK: UPDATE()
    //---------------------------------------------------------------
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
        if currentTime > creationTime {

            createZombieAnchor()
            creationTime = currentTime + TimeInterval(randomFloat(min: 3.0, max: 6.0))

        }
        
        //-----------------------------------
        // Color Change
        //-----------------------------------
        
        //if(night){
        
        // 1
        guard let currentFrame = sceneView.session.currentFrame,
            let lightEstimate = currentFrame.lightEstimate else {
                return
        }
        
        // 2
        let neutralIntensity: CGFloat = 1000
        let ambientIntensity = min(lightEstimate.ambientIntensity,
                                   neutralIntensity)
        let blendFactor = 1 - ambientIntensity / neutralIntensity
        
        // 3
        for node in children {
            if let bug = node as? SKSpriteNode {
                bug.color = .green
                bug.colorBlendFactor = blendFactor
            }
        }
     
       // }
        
           //-------------------------------
    }
    
    
    //--------------------------------------------------------------------------------------
    //MARK: Touch()
    //--------------------------------------------------------------------------------------
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get the first touch
        guard let touch = touches.first else {
            return
        }
      
        
        
        
            let location = sight.position
            let hitNodes = nodes(at: location)
        
         var hitBug: SKNode?
        
        for node in hitNodes {
            if node.name == "Attack" {
                hitBug = node
                break
            }
        }
        
            
       
        for node in hitNodes {
            if node.name == "nightvision" {
                hitBug = node
                break
            }
        }

        //run(Sounds.fire)
        if let hitBug = hitBug,
            let anchor = sceneView.anchor(for: hitBug) {
            let action = SKAction.run {
                self.sceneView.session.remove(anchor: anchor)
            }
            let group = SKAction.group([killSound, action])
            let sequence = [SKAction.wait(forDuration: 0.3), group]
            hitBug.run(SKAction.sequence(sequence))
        }
            
            
            
        }
    }
//}
