//
//  Scene.swift
//  ARSpriteKit
//
//  Created by Esteban Herrera on 7/4/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import SpriteKit
import ARKit

class Level2: SKScene {
    
    
    var sceneView: ARSKView {
        return view as! ARSKView
    }
    
    //---------------------------------
    // Flags
    //---------------------------------
    
    var night: Bool! = false;
    var showhalfblood: Bool! = false;
    var showEmptyblood: Bool! = false;
     var restart: Bool! = false;
    
    var gem: Bool! = false;
    
    //---------------------------------
    // Levels
    //---------------------------------
    
    var StartGame: Bool! = false;
    var level1: Bool! = false;
    var level2: Bool! = false;
    
    
    
    
    //Button
    let exitbtn:SKSpriteNode = SKSpriteNode(imageNamed:"exitbtn")
    let nightvision:SKSpriteNode = SKSpriteNode(imageNamed:"night")
    
    
    //Sound
    let killSound = SKAction.playSoundFileNamed("ghost", waitForCompletion: false)
    
    //Timer Variable
    var sec = 60
    var min = 1
    
    var sg = 0
    
    
    
    
    //---------------------------
    // variables
    //---------------------------
    
    
    var TouchCount = 0
    
    var creationTime : TimeInterval = 0
     var creationTimep : TimeInterval = 0
    
    
   // let timer = SKLabelNode(text: " ")
    
    let Loose = SKLabelNode(text: "You loose")
    
    let ghostsLabel = SKLabelNode(text: "Zombies")
    let killsLabel = SKLabelNode(text: "No.of Kills")
    let HealthLabel = SKLabelNode(text: "Health")
    let numberOfGhostsLabel = SKLabelNode(text: "0")
    let numberOfHealthsLabel = SKLabelNode(text: "5")
    let numberOfKillsLabel = SKLabelNode(text: "0")
    
    let vaccineLabel = SKLabelNode(text: "Vaccine Effect")
    
    let health100:SKSpriteNode = SKSpriteNode(imageNamed:"health100p")
    let health50:SKSpriteNode = SKSpriteNode(imageNamed:"health50p")
    let health10:SKSpriteNode = SKSpriteNode(imageNamed:"health10p")
    
    
    let blood:SKSpriteNode = SKSpriteNode(imageNamed:"blood")
    let wasted:SKSpriteNode = SKSpriteNode(imageNamed:"wasted")
    
    
    
    var ghostCount = 0 {
        didSet{
            self.numberOfGhostsLabel.text = "\(ghostCount)"
        }
    }
    
    var KillsCount = 0 {
        didSet{
            self.numberOfKillsLabel.text = "\(KillsCount)"
        }
    }
    var HealthCount = 10 {
        didSet{
            self.numberOfHealthsLabel.text = "\(HealthCount)"
        }
    }
    
    
    //Characters
    var sight: SKSpriteNode!
    
    
    
    override func didMove(to view: SKView) {
        
        
        nightvision.name = "nightvision"
        
        exitbtn.position = CGPoint(x:300, y:550)
        addChild(exitbtn)
        
        health100.position = CGPoint(x:-300, y:500)
        health50.position = CGPoint(x:-300, y:500)
        health10.position = CGPoint(x:-300, y:500)
        addChild(health100)
        
        vaccineLabel.fontSize = 30
        vaccineLabel.fontName = "DevanagariSangamMN-Bold"
        vaccineLabel.color = .white
        vaccineLabel.position = CGPoint(x: -280, y: 550)
        
        addChild(vaccineLabel)
        
         blood.position = CGPoint(x:-200, y:500)
        
        
        nightvision.position = CGPoint(x:-300, y:550)
        //addChild(nightvision)
        
        
        Loose.fontSize = 30
        Loose.fontName = "DevanagariSangamMN-Bold"
        Loose.color = .white
        
        
        
        ghostsLabel.fontSize = 30
        ghostsLabel.fontName = "DevanagariSangamMN-Bold"
        ghostsLabel.color = .white
        ghostsLabel.position = CGPoint(x: -0, y: -500)
        
        addChild(ghostsLabel)
        
        numberOfGhostsLabel.fontSize = 30
        numberOfGhostsLabel.fontName = "DevanagariSangamMN-Bold"
        numberOfGhostsLabel.color = .white
        numberOfGhostsLabel.position = CGPoint(x: -0, y: -550)
        
        addChild(numberOfGhostsLabel)
        
        
        killsLabel.fontSize = 30
        killsLabel.fontName = "DevanagariSangamMN-Bold"
        killsLabel.color = .white
        killsLabel.position = CGPoint(x:150, y: -500)
        
        addChild(killsLabel)
        
        numberOfKillsLabel.fontSize = 30
        numberOfKillsLabel.fontName = "DevanagariSangamMN-Bold"
        numberOfKillsLabel.color = .white
        numberOfKillsLabel.position = CGPoint(x: 150, y: -550)
        
        addChild(numberOfKillsLabel)
        
        
        HealthLabel.fontSize = 30
        HealthLabel.fontName = "DevanagariSangamMN-Bold"
        HealthLabel.color = .white
        HealthLabel.position = CGPoint(x: 300, y: -500)
        
        addChild(HealthLabel)
        
        
        numberOfHealthsLabel.fontSize = 30
        numberOfHealthsLabel.fontName = "DevanagariSangamMN-Bold"
        numberOfHealthsLabel.color = .white
        numberOfHealthsLabel.position = CGPoint(x: 300, y: -550)
        
        addChild(numberOfHealthsLabel)
        
        
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
    
    
    func createPowerAnchor(){
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
    
    
    func Night(){
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
        
    }
   
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
//        if currentTime > creationTime {
//
//            createZombieAnchor()
//            HealthCount = HealthCount - 1
//            creationTime = currentTime + TimeInterval(randomFloat(min: 3.0, max: 6.0))
//
//        }
         if(StartGame){
        
        if currentTime > creationTimep {
            
            createPowerAnchor()
            
            HealthCount = HealthCount - 1
            creationTimep = currentTime + TimeInterval(randomFloat(min: 3.0, max: 6.0))
            
        }
        
        
        health50.removeFromParent()
        health10.removeFromParent()
        Loose.removeFromParent()
        blood.removeFromParent()
        wasted.removeFromParent()
        
        
        if(HealthCount <= 5 && HealthCount >= 1){
            health100.removeFromParent()
            
            showhalfblood = true
            
            if(showhalfblood){
                addChild(health50)
            }
            
            showhalfblood = false
            //health50.removeFromParent()
            
            
        }
        
        if(HealthCount <= 1 ){
            health50.removeFromParent()
            
            showEmptyblood = true
            
            if(showEmptyblood){
                addChild(health10)
                addChild(blood)
                addChild(wasted)
                restart = true
                StartGame = false
            }
            
            showEmptyblood = false
            
        }
        
        Night() // function to change color
        
        }//startgame end
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
        let location1 = touch.location(in: self)
        
        // Get the nodes at that location
        let hit = nodes(at: location1)
        
        // Get the first node (if any)
        if let node = hit.first {
            
            TouchCount = TouchCount + 1;
            print(TouchCount)
            
            if(TouchCount > 3){
                
                TouchCount = 0;
            }
            // Check if the node is a ghost (remember that labels are also a node)
            
            //---------------------------
            // MARK: kill Zombie
            //--------------------------
            if node.name == "nightvision" {
                
                night = true;
                
                
            }
            
            
            
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
        
        
        //run(Sounds.fire)
        if let hitBug = hitBug,
            let anchor = sceneView.anchor(for: hitBug)
        {
            if(TouchCount >= 3){
            
                let action = SKAction.run
                {
           
                    self.sceneView.session.remove(anchor: anchor)
            
                }
            
                let group = SKAction.group([killSound, action])
                let sequence = [SKAction.wait(forDuration: 0.3), group]
                hitBug.run(SKAction.sequence(sequence))
                ghostCount -= 1
                KillsCount += 1
            }
        
        }
        
        
        
        if(sg == 0) {
            
            StartGame = true;
            sg = sg + 1
        }
        
        
        
        if(KillsCount > 4) {
            
            let firstScene = ChangeToLevel3(fileNamed: "ChangeToLevel3")
            let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
            firstScene?.scaleMode = .aspectFill
            scene?.view?.presentScene(firstScene!, transition: transition)

            
        }
        
        if(restart){
            let firstScene = RestartLevel2(fileNamed: "RestartLevel2")
            let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
            firstScene?.scaleMode = .aspectFill
            scene?.view?.presentScene(firstScene!, transition: transition)
            
            
        }
        
        
        
        
        
        
    }
}



// -----------------------------------  THE END ---------------------------------------------------

//   Notes:

//            sec = sec - 1
//
//
//            if(sec == 0){
//                min = min - 1
//            }
//
//            if(sec == 0 && min == 0){
//
//                addChild(Loose)
//            }
//
//            timer.text = "\(min):\(sec)"

