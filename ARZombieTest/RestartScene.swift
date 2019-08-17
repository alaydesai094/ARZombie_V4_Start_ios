//
//  Scene.swift
//  ARSpriteKit
//
//  Created by Esteban Herrera on 7/4/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import SpriteKit
import ARKit

class RestartScene: SKScene {
    
    //--------------------------
    
       let restartLabel = SKLabelNode(text: "Restart")
     let blood:SKSpriteNode = SKSpriteNode(imageNamed:"blood")
    
    
    override func didMove(to view: SKView) {
        
        restartLabel.fontSize = 60
        restartLabel.fontName = "DevanagariSangamMN-Bold"
        restartLabel.color = .white
        addChild(restartLabel)
        
         blood.position = CGPoint(x:-200, y:500)
        addChild(blood)
        
        let restartbutton = SKSpriteNode(imageNamed: "restart")
        restartbutton.position = CGPoint(x: 0 , y: -100 )
        restartbutton.name = "next2"
        
        
        self.addChild(restartbutton)
        
        
        
        
        let button = SKSpriteNode(imageNamed: "exitbtn")
        button.position = CGPoint(x:300, y:550)
      
        
        self.addChild(button)
        
        
    }
    
    
    //--------------------------------------------------------------
    // MARK: UPDATE()
    //---------------------------------------------------------------
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
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
            
            
            if node.name == "next2" {
                
                let firstScene = GameScene(fileNamed: "GameScene")
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
                firstScene?.scaleMode = .aspectFill
                scene?.view?.presentScene(firstScene!, transition: transition)
                
                
            }
            
            
        }
    }
}
