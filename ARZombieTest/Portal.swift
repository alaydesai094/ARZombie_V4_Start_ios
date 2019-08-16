//
//  Scene.swift
//  ARSpriteKit
//
//  Created by Esteban Herrera on 7/4/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import SpriteKit
import ARKit

class Portal: SKScene {
    
    //--------------------------
    
    let levelup:SKSpriteNode = SKSpriteNode(imageNamed:"levelup")
    
    
    override func didMove(to view: SKView) {
        
        
        addChild(levelup)
        
        let button = SKSpriteNode(imageNamed: "next2")
        button.position = CGPoint(x:300, y:550)
        button.name = "next2"
        
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
                
//                let firstScene = Level2Story(fileNamed: "Level2Story")
//                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
//                firstScene?.scaleMode = .aspectFill
//                scene?.view?.presentScene(firstScene!, transition: transition)
//                
                
            }
            
            
        }
    }
}

