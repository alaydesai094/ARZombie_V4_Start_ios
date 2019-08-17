//
//  Scene.swift
//  ARSpriteKit
//
//  Created by Esteban Herrera on 7/4/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import SpriteKit
import ARKit

class Level2Story: SKScene {
    
    
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
    let StoryLabel = SKLabelNode(text: "Well Done Soldier...!!")
    let StoryLabel1 = SKLabelNode(text: "our reports says that the")
    let StoryLabel2 = SKLabelNode(text: "zombies are now adapting to our")
    let StoryLabel3 = SKLabelNode(text: "world and are getting more powerful..")
    let StoryLabel4 = SKLabelNode(text: "you need to shoot more then once")
    
    
    // Secene 2
    let Page2 = SKLabelNode(text: "we are getting closure to the gems..")
    let Page21 = SKLabelNode(text: "Keep your eyes open for the gems.")
    let Page22 = SKLabelNode(text: "Also look out for the zombies..")
    let Page23 = SKLabelNode(text: "they are hard to kill now")
    let Page24 = SKLabelNode(text: "you can get infacted if your vaccine is low ")
    
    // Scene 3
    let Page3 = SKLabelNode(text: "Hey...this is Dr Steve...")
    let Page31 = SKLabelNode(text: "the infection is spreading faster")
    let Page32 = SKLabelNode(text: "you cannot stay longer outside")
    let Page33 = SKLabelNode(text: "Try to finish your mission ASAP..")
    let Page34 = SKLabelNode(text: "or else you can loose your life...")
    
    
    // Sceene 4
    let Page4 = SKLabelNode(text: "Hello Soldier...")
    let Page41 = SKLabelNode(text: "This is your commander.. ")
    let Page42 = SKLabelNode(text: " Our next mission : 1. kill 25 zombies...")
    let Page43 = SKLabelNode(text: "2. Collect the gem..")
    let Page44 = SKLabelNode(text: "Lets gooo....!!")
    
    
    
    
    
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
                
                
                let firstScene = Level2(fileNamed: "Level2")
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
