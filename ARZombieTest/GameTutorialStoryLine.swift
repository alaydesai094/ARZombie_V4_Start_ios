//
//  Scene.swift
//  ARSpriteKit
//
//  Created by Esteban Herrera on 7/4/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import SpriteKit
import ARKit

class GameTutorialStoryLine: SKScene {
    
    
    //---------------------
    // MARK: Flags
    //--------------------
    var story1: Bool! = false;
    var story2: Bool! = false;
    var story3: Bool! = false;
    var story4: Bool! = false;
    
    
    
    //-------------------------
    // MARK: Button
    //--------------------------
    
    let next0:SKSpriteNode = SKSpriteNode(imageNamed:"next")
    let next1:SKSpriteNode = SKSpriteNode(imageNamed:"next1")
    let next2:SKSpriteNode = SKSpriteNode(imageNamed:"next2")
    let next3:SKSpriteNode = SKSpriteNode(imageNamed:"next3")
    
    
    //----------------------------------
    // MARK: Characters
    //----------------------------------
    
    let mayour:SKSpriteNode = SKSpriteNode(imageNamed:"May")
    let nic:SKSpriteNode = SKSpriteNode(imageNamed:"bignick")
    let cap:SKSpriteNode = SKSpriteNode(imageNamed:"capt")
    
    
    //----------------------------------------------
    // MARK: Storyline Variables
    //-------------------------------------------------
    // Scene 1
    let StoryLabel = SKLabelNode(text: "In Parallel Universe..")
    let StoryLabel1 = SKLabelNode(text: "Where every one was Animated,")
    let StoryLabel2 = SKLabelNode(text: "that universe is now taken over by zombies..")
    let StoryLabel3 = SKLabelNode(text: "Now they are trying reach")
    let StoryLabel4 = SKLabelNode(text: "into the real world... ")
    
    
    // Secene 2
    let Page2 = SKLabelNode(text: "According to legands...")
    let Page21 = SKLabelNode(text: "we can send these zombies back.. ")
    let Page22 = SKLabelNode(text: "if we can collect 2 hidden gems..")
    let Page23 = SKLabelNode(text: "one who collects both the gems")
    let Page24 = SKLabelNode(text: "will be able to open the portal...")
    
    // Scene 3
    let Page3 = SKLabelNode(text: "Hey..this is DR. Steve...")
    let Page31 = SKLabelNode(text: "The city is infected..")
    let Page32 = SKLabelNode(text: "I have given you special vaccine..")
    let Page33 = SKLabelNode(text: "so that you can go out for missions...")
    let Page34 = SKLabelNode(text: "the vaccine won't last long... so be safe")
    
    
    // Sceene 4
    let Page4 = SKLabelNode(text: "Hello Soldier...")
    let Page41 = SKLabelNode(text: "This is your Commander.. ")
    let Page42 = SKLabelNode(text: " Our mission : kill 15 zombies...")
    let Page43 = SKLabelNode(text: "that are surrounding the parameters ")
    let Page44 = SKLabelNode(text: "and report back before you get infected... ")
    
    
    
    
    
    
    
    override func didMove(to view: SKView) {
        
        //--------------------------
        // Scene 1 display configs
        //---------------------------
        StoryLabel.position = CGPoint(x:0, y:250)
        StoryLabel.fontSize = 40
        StoryLabel.fontName = "DevanagariSangamMN-Bold"
        StoryLabel.color = .white
        
        StoryLabel1.position = CGPoint(x:0, y:200)
        StoryLabel1.fontSize = 40
        StoryLabel1.fontName = "DevanagariSangamMN-Bold"
        StoryLabel1.color = .white
        
        StoryLabel2.position = CGPoint(x:0, y:150)
        StoryLabel2.fontSize = 40
        StoryLabel2.fontName = "DevanagariSangamMN-Bold"
        StoryLabel2.color = .white
        
        StoryLabel3.position = CGPoint(x:0, y:100)
        StoryLabel3.fontSize = 40
        StoryLabel3.fontName = "DevanagariSangamMN-Bold"
        StoryLabel3.color = .white
        
        StoryLabel4.position = CGPoint(x:0, y:50)
        StoryLabel4.fontSize = 40
        StoryLabel4.fontName = "DevanagariSangamMN-Bold"
        StoryLabel4.color = .white
        
        
        //--------------------------
        // Scene 2 display configs
        //---------------------------
        Page2.position = CGPoint(x:0, y:250)
        Page2.fontSize = 40
        Page2.fontName = "DevanagariSangamMN-Bold"
        Page2.color = .white
        
        Page21.position = CGPoint(x:0, y:200)
        Page21.fontSize = 40
        Page21.fontName = "DevanagariSangamMN-Bold"
        Page21.color = .white
        
        Page22.position = CGPoint(x:0, y:150)
        Page22.fontSize = 40
        Page22.fontName = "DevanagariSangamMN-Bold"
        Page22.color = .white
        
        Page23.position = CGPoint(x:0, y:100)
        Page23.fontSize = 40
        Page23.fontName = "DevanagariSangamMN-Bold"
        Page23.color = .white
        
        Page24.position = CGPoint(x:0, y:50)
        Page24.fontSize = 40
        Page24.fontName = "DevanagariSangamMN-Bold"
        Page24.color = .white
        
        //--------------------------
        // Scene 3 display configs
        //---------------------------
        Page3.position = CGPoint(x:0, y:250)
        Page3.fontSize = 40
        Page3.fontName = "DevanagariSangamMN-Bold"
        Page3.color = .white
        
        Page31.position = CGPoint(x:0, y:200)
        Page31.fontSize = 40
        Page31.fontName = "DevanagariSangamMN-Bold"
        Page31.color = .white
        
        Page32.position = CGPoint(x:0, y:150)
        Page32.fontSize = 40
        Page32.fontName = "DevanagariSangamMN-Bold"
        Page32.color = .white
        
        Page33.position = CGPoint(x:0, y:100)
        Page33.fontSize = 40
        Page33.fontName = "DevanagariSangamMN-Bold"
        Page33.color = .white
        
        Page34.position = CGPoint(x:0, y:50)
        Page34.fontSize = 40
        Page34.fontName = "DevanagariSangamMN-Bold"
        Page34.color = .white
        
        //--------------------------
        // Scene 4 display configs
        //---------------------------
        Page4.position = CGPoint(x:0, y:250)
        Page4.fontSize = 40
        Page4.fontName = "DevanagariSangamMN-Bold"
        Page4.color = .white
        
        Page41.position = CGPoint(x:0, y:200)
        Page41.fontSize = 40
        Page41.fontName = "DevanagariSangamMN-Bold"
        Page41.color = .white
        
        Page42.position = CGPoint(x:0, y:150)
        Page42.fontSize = 40
        Page42.fontName = "DevanagariSangamMN-Bold"
        Page42.color = .white
        
        Page43.position = CGPoint(x:0, y:100)
        Page43.fontSize = 40
        Page43.fontName = "DevanagariSangamMN-Bold"
        Page43.color = .white
        
        Page44.position = CGPoint(x:0, y:50)
        Page44.fontSize = 40
        Page44.fontName = "DevanagariSangamMN-Bold"
        Page44.color = .white
        
        
        //Button
        next0.position = CGPoint(x:200, y:-170)
        next1.position = CGPoint(x:200, y:-170)
        next2.position = CGPoint(x:200, y:-170)
        next3.position = CGPoint(x:200, y:-170)
        
        
        
        // Characters
        mayour.position = CGPoint(x:-150, y:-170)
        nic.position = CGPoint(x:-150, y:-220)
        cap.position = CGPoint(x:-150, y:-170)
        
        
        
        // ADD Scene 1 on screen
        
        addChild(nic)
        
        addChild(next0)
        
        addChild(StoryLabel)
        addChild(StoryLabel1)
        addChild(StoryLabel2)
        addChild(StoryLabel3)
        addChild(StoryLabel4)
        
        
        
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
            
            if node == next0 {
                
                story2 = true;
                
            }
            
            if node == next1 {
                
                story2 = false;
                story3 = true;
                
            }
            
            if node == next2 {
                
                story3 = false;
                story4 = true;
                
                
            }
            
            
            if node == next3 {
                
                
                
                
                Page4.removeFromParent()
                Page41.removeFromParent()
                Page42.removeFromParent()
                Page43.removeFromParent()
                Page44.removeFromParent()
                
                next3.removeFromParent()
                cap.removeFromParent()
                
                
                let firstScene = GameTutorial(fileNamed: "GameTutorial")
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
                firstScene?.scaleMode = .aspectFill
                scene?.view?.presentScene(firstScene!, transition: transition)
                
                
            }
            
            
            
            
            if(story2){
                
                
                nic.removeFromParent()
                next0.removeFromParent()
                
                
                StoryLabel.removeFromParent()
                StoryLabel1.removeFromParent()
                StoryLabel2.removeFromParent()
                StoryLabel3.removeFromParent()
                StoryLabel4.removeFromParent()
                
                print("Scene 1 Done")
                
                
                
                addChild(Page2)
                addChild(Page21)
                addChild(Page22)
                addChild(Page23)
                addChild(Page24)
                
                addChild(next1)
                addChild(nic)
                
                print("Loding Scene 2")
                
                
            }
            
            if(story3){
                
                
                nic.removeFromParent()
                next1.removeFromParent()
                
                Page2.removeFromParent()
                Page21.removeFromParent()
                Page22.removeFromParent()
                Page23.removeFromParent()
                Page24.removeFromParent()
                
                print("Scene 2 Done")
                
                
                
                addChild(Page3)
                addChild(Page31)
                addChild(Page32)
                addChild(Page33)
                addChild(Page34)
                
                addChild(next2)
                addChild(mayour)
                
                print("Loding Scene 3")
                
                
            }
            
            if(story4){
                
                
                next2.removeFromParent()
                mayour.removeFromParent()
                
                Page3.removeFromParent()
                Page31.removeFromParent()
                Page32.removeFromParent()
                Page33.removeFromParent()
                Page34.removeFromParent()
                
                print("Scene 3 Done")
                
                
                
                addChild(Page4)
                addChild(Page41)
                addChild(Page42)
                addChild(Page43)
                addChild(Page44)
                
                addChild(next3)
                addChild(cap)
                
                print("Loding Scene 4")
                
            }
            
            
            //---------------------------------------
            // Mark: go back
            //--------------------------------------
            
            
            
            
            
            
            
        }
    }
}
