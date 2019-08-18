//
//  Scene.swift
//  ARSpriteKit
//
//  Created by Esteban Herrera on 7/4/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    
    //--------------------------
    
    let mainbg:SKSpriteNode = SKSpriteNode(imageNamed:"mainbg")
    let button = SKSpriteNode(imageNamed: "start")
    
    
    
    override func didMove(to view: SKView) {
        
        mainbg.position = CGPoint(x:250, y:300)
         mainbg.zPosition = -1
        addChild(mainbg)
        
        
        button.position = CGPoint(x:200, y:100)
        button.name = "next2"
        
        addChild(button)
        
        
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
                
                let firstScene = GameTutorialStoryLine(fileNamed: "GameTutorialStoryLine")
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
                firstScene?.scaleMode = .aspectFill
                scene?.view?.presentScene(firstScene!, transition: transition)
                
                
            }
            
            
        }
    }
}
