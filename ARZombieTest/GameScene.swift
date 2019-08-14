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
    
    //-------------------------
    // MARK: Button
    //--------------------------
    
    let exitbtn:SKSpriteNode = SKSpriteNode(imageNamed:"exitbtn")
    
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
    
    
    override func didMove(to view: SKView) {
        
          exitbtn.position = CGPoint(x:300, y:550)
          addChild(exitbtn)
        
        
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
        translation.columns.3.z = -1 - randomFloat(min: 0.0, max: 1.0)
        
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
        
        
    }
    
    
    //--------------------------------------------------------------------------------------
    //MARK: Touch()
    //--------------------------------------------------------------------------------------
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get the first touch
        guard let touch = touches.first else {
            return
        }
        // Get the location in the AR scene
        let location = touch.location(in: self)
        
        // Get the nodes at that location
        let hit = nodes(at: location)
        
        // Get the first node (if any)
        if let node = hit.first {
            // Check if the node is a ghost (remember that labels are also a node)
            
            
            if node == exitbtn {
                
               
            }
            
            
            
            
            
        }
    }
}
