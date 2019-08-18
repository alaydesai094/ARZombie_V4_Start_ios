//
//  Scene.swift
//  ARSpriteKit
//
//  Created by Esteban Herrera on 7/4/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import SpriteKit
import ARKit

class GameTutorial: SKScene {
    
    
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
    var disp: Bool! = false;
    
    
    //-----------------------------
    // MARK: Tutorial Flags
    //-----------------------------
    
     var Tut1: Bool! = false;
     var Tut2: Bool! = false;
     var Tut3: Bool! = false;
     var Tut4: Bool! = false;
     var Tut5: Bool! = false;
     var Tut6: Bool! = false;
    
    
    
    
    //Button
    let exitbtn:SKSpriteNode = SKSpriteNode(imageNamed:"exitbtn")
    let nightvision:SKSpriteNode = SKSpriteNode(imageNamed:"night")
    let nextl:SKSpriteNode = SKSpriteNode(imageNamed:"next")
    
    
    //Sound
    let killSound = SKAction.playSoundFileNamed("ghost", waitForCompletion: false)
    let loseSound = SKAction.playSoundFileNamed("lose", waitForCompletion: false)
    
    //Timer Variable
    var sec = 30
    var min = 1
    
    var sg = 0
    
    
    
    
    //---------------------------
    // variables
    //---------------------------
    
    
    var TouchCount = 0
    
    var creationTime : TimeInterval = 0
    var gameTime : TimeInterval = 0
    var HealthTime : TimeInterval = 0
    
    
    let timer = SKLabelNode(text: " ")
    
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
    
    // Tutorial fingers
   
    let Vaccine:SKSpriteNode = SKSpriteNode(imageNamed:"fingerup")
     let VaccineTut = SKLabelNode(text: "This Is Vaccine..!!")
    let VaccineTut2 = SKLabelNode(text: "Try not to run out of it...!")
    let VaccineTut3 = SKLabelNode(text: "Tap on the finger for next... ")
    
    let figTimer:SKSpriteNode = SKSpriteNode(imageNamed:"fingerup")
    let TimerTut = SKLabelNode(text: "This Is Game Timmer..!!")
    let TimerTut2 = SKLabelNode(text: "Try not to run out of it too..!!")
    
    let figZombie:SKSpriteNode = SKSpriteNode(imageNamed:"fingerdown")
    let ZombieTut = SKLabelNode(text: "This Is Zombie Count..!!")
    let ZombieTut2 = SKLabelNode(text: "Shows The no. of zombies around you..!!")
    
    let figHealth:SKSpriteNode = SKSpriteNode(imageNamed:"fingerdown")
    let HealthTut = SKLabelNode(text: "This Is Health Count.!!")
    let HealthTut2 = SKLabelNode(text: "Your health decreases as the time progresses.!!")
    
    let figKill:SKSpriteNode = SKSpriteNode(imageNamed:"fingertap")
    let KillTut = SKLabelNode(text: "Great..!! Now To Kill the Zombies..")
    let KillTut2 = SKLabelNode(text: "Put the Target On the zombie and tap to kill..")
    let KillTut3 = SKLabelNode(text: "start the game by tapping and Start Killing")
    
    
    
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
    var HealthCount = 100 {
        didSet{
            self.numberOfHealthsLabel.text = "\(HealthCount)"
        }
    }
    
    
    //Characters
    var sight: SKSpriteNode!
    
    
    
    override func didMove(to view: SKView) {
        
        
        nextl.name = "Nextl"
        
        
        
        timer.fontSize = 50
        timer.fontName = "DevanagariSangamMN-Bold"
        timer.color = .white
        timer.text = "\(min):\(sec)"
        timer.position = CGPoint(x: -0, y: 550)
        addChild(timer)
        
        nightvision.name = "nightvision"
        
        exitbtn.position = CGPoint(x:300, y:550)
        addChild(exitbtn)
        
        health100.position = CGPoint(x:-300, y:500)
        health50.position = CGPoint(x:-300, y:500)
        health10.position = CGPoint(x:-300, y:500)
        
        addChild(health100)
        
        blood.position = CGPoint(x:-200, y:500)
        
        
        vaccineLabel.fontSize = 40
        vaccineLabel.fontName = "DevanagariSangamMN-Bold"
        vaccineLabel.color = .white
        vaccineLabel.position = CGPoint(x: -280, y:550)
        
        addChild(vaccineLabel)
        
        
        
        nightvision.position = CGPoint(x:-300, y:550)
        //addChild(nightvision)
        
        
        Loose.fontSize = 40
        Loose.fontName = "DevanagariSangamMN-Bold"
        Loose.color = .white
        
        
        
        ghostsLabel.fontSize = 40
        ghostsLabel.fontName = "DevanagariSangamMN-Bold"
        ghostsLabel.color = .white
        ghostsLabel.position = CGPoint(x: -0, y: -500)
        
        addChild(ghostsLabel)
        
        numberOfGhostsLabel.fontSize = 40
        numberOfGhostsLabel.fontName = "DevanagariSangamMN-Bold"
        numberOfGhostsLabel.color = .white
        numberOfGhostsLabel.position = CGPoint(x: -0, y: -550)
        
        addChild(numberOfGhostsLabel)
        
        
        killsLabel.fontSize = 40
        killsLabel.fontName = "DevanagariSangamMN-Bold"
        killsLabel.color = .white
        killsLabel.position = CGPoint(x:150, y: -500)
        
        addChild(killsLabel)
        
        numberOfKillsLabel.fontSize = 40
        numberOfKillsLabel.fontName = "DevanagariSangamMN-Bold"
        numberOfKillsLabel.color = .white
        numberOfKillsLabel.position = CGPoint(x: 150, y: -550)
        
        addChild(numberOfKillsLabel)
        
        
        HealthLabel.fontSize = 40
        HealthLabel.fontName = "DevanagariSangamMN-Bold"
        HealthLabel.color = .white
        HealthLabel.position = CGPoint(x: 300, y: -500)
        
        addChild(HealthLabel)
        
        
        numberOfHealthsLabel.fontSize = 40
        numberOfHealthsLabel.fontName = "DevanagariSangamMN-Bold"
        numberOfHealthsLabel.color = .white
        numberOfHealthsLabel.position = CGPoint(x: 300, y: -550)
        
        addChild(numberOfHealthsLabel)
        
        
        // tutorial Nodes
        
        Vaccine.position = CGPoint(x: -280, y: 350)
        
        VaccineTut.fontSize = 40
        VaccineTut.fontName = "DevanagariSangamMN-Bold"
        VaccineTut.color = .white
        
        VaccineTut2.fontSize = 40
        VaccineTut2.fontName = "DevanagariSangamMN-Bold"
        VaccineTut2.color = .white
        VaccineTut2.position = CGPoint(x:0, y:-50)
        
        VaccineTut3.fontSize = 40
        VaccineTut3.fontName = "DevanagariSangamMN-Bold"
        VaccineTut3.color = .white
        VaccineTut3.position = CGPoint(x:0, y:-100)
        
        
        figTimer.position = CGPoint(x: -0, y: 450)
        
        TimerTut.fontSize = 40
        TimerTut.fontName = "DevanagariSangamMN-Bold"
        TimerTut.color = .white
        
        TimerTut2.fontSize = 40
        TimerTut2.fontName = "DevanagariSangamMN-Bold"
        TimerTut2.color = .white
        TimerTut2.position = CGPoint(x:0, y:-50)
        
        
        figZombie.position = CGPoint(x: -0, y: -400)
        
        ZombieTut.fontSize = 40
        ZombieTut.fontName = "DevanagariSangamMN-Bold"
        ZombieTut.color = .white
        
        ZombieTut2.fontSize = 40
        ZombieTut2.fontName = "DevanagariSangamMN-Bold"
        ZombieTut2.color = .white
        ZombieTut2.position = CGPoint(x:0, y:-50)
        
        
      
        figHealth.position = CGPoint(x: 300, y: -400)
        
        HealthTut.fontSize = 40
        HealthTut.fontName = "DevanagariSangamMN-Bold"
        HealthTut.color = .white
        
        HealthTut2.fontSize = 40
        HealthTut2.fontName = "DevanagariSangamMN-Bold"
        HealthTut2.color = .white
         HealthTut2.position = CGPoint(x:0, y:-50)
        
        
        figKill.position = CGPoint(x: 0, y: -100)
        
        KillTut.fontSize = 40
        KillTut.fontName = "DevanagariSangamMN-Bold"
        KillTut.color = .white
        KillTut.position = CGPoint(x:0, y:-100)
        
        KillTut2.fontSize = 40
        KillTut2.fontName = "DevanagariSangamMN-Bold"
        KillTut2.color = .white
        KillTut2.position = CGPoint(x:0, y:-150)
        
        
        KillTut3.fontSize = 40
        KillTut3.fontName = "DevanagariSangamMN-Bold"
        KillTut3.color = .white
        KillTut3.position = CGPoint(x:0, y:-200)
        
        
        
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
        
        if let currentFrame = sceneView.session.currentFrame {
            
            var translation = matrix_identity_float4x4
            translation.columns.3.x = randomFloat(min: -1, max: 1)
            translation.columns.3.y = randomFloat(min: -1, max: 1)
            translation.columns.3.z = randomFloat(min: -3, max: -0.2)
            let transform = simd_mul(currentFrame.camera.transform, translation)
            
            // Create an anchor
            let anchor = ARAnchor(transform: transform)
            
            // Add the anchor
            sceneView.session.add(anchor: anchor)
            
            // Increment the counter
            ghostCount += 1
        }
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
        
        
        if(StartGame){
            
            
            health50.removeFromParent()
            health10.removeFromParent()
            blood.removeFromParent()
            wasted.removeFromParent()
            
            figKill.removeFromParent()
            KillTut.removeFromParent()
            KillTut2.removeFromParent()
            KillTut3.removeFromParent()
            
            if currentTime > creationTime {
                
                createZombieAnchor()
                creationTime = currentTime + TimeInterval(randomFloat(min: 2.0, max: 4.0))
                
            }
            
            if currentTime > gameTime {
                
                
                
                
                
                if(sec == 0){
                    sec = 60
                    min = min - 1
                }
                
                if(sec == 0 && min == 0){
                    
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
                
                sec = sec - 1
                timer.text = "\(min):\(sec)"
                
                gameTime = currentTime + TimeInterval(randomFloat(min: 1.0, max: 2.0))
                
            }
            
            if currentTime > HealthTime {
                
                HealthCount = HealthCount - 5
                HealthTime = currentTime + TimeInterval(randomFloat(min: 3.0, max: 6.0))
                
            }
            
            
            if(HealthCount <= 50 && HealthCount >= 2){
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
            
            if(ghostCount <= 0 ){
                
                ghostCount = 0
            }
            
            
            
            Night() // function to change color
            
        } // startgame ends
        
        
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
            
            if(TouchCount > 2){
                
                TouchCount = 0;
            }
            // Check if the node is a ghost (remember that labels are also a node)
            
            //---------------------------
            // MARK: kill Zombie
            //--------------------------
            if (node == Vaccine) {
                
                Tut2 = true
            }
            else{ }
            
            if (node == figTimer) {
                
                Tut3 = true
            }
            else{ }
            
            if (node == figZombie) {
                
                Tut4 = true
            }
            else{ }
            if (node == figHealth) {
                
                Tut5 = true
            }
            else{ }
            
            if (node == figKill) {
                
                StartGame = true
            }
            else{ }
            
            
            
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
            let anchor = sceneView.anchor(for: hitBug) {
            let action = SKAction.run {
                self.sceneView.session.remove(anchor: anchor)
            }
            let group = SKAction.group([killSound, action])
            let sequence = [SKAction.wait(forDuration: 0.3), group]
            hitBug.run(SKAction.sequence(sequence))
            ghostCount -= 1
            KillsCount += 1
        }
        
        
        
        
        if(sg == 0) {
            
            Tut1 = true
            sg = sg + 1
        }
        
        
        if(KillsCount == 5) {
            
            StartGame = false;
            //level1 = true;
            let firstScene = ChangeToMainGame(fileNamed: "ChangeToMainGame")
            let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
            firstScene?.scaleMode = .aspectFill
            scene?.view?.presentScene(firstScene!, transition: transition)
            
            
            
        }
        
        
        if(restart){
            let firstScene = RestartScene(fileNamed: "RestartScene")
            let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
            firstScene?.scaleMode = .aspectFill
            scene?.view?.presentScene(firstScene!, transition: transition)
            
            
        }
        
        if(Tut1){
            
            addChild(Vaccine)
            addChild(VaccineTut)
            addChild(VaccineTut2)
             addChild(VaccineTut3)
            
            Tut1 = false
           
            
        }
        
        if(Tut2){
            
             Vaccine.removeFromParent()
             VaccineTut.removeFromParent()
             VaccineTut2.removeFromParent()
             VaccineTut3.removeFromParent()
            
            addChild(figTimer)
            addChild(TimerTut)
             addChild(TimerTut2)
            
            Tut2 = false
            
        }
        
        if(Tut3){
            
            
            
            figTimer.removeFromParent()
            TimerTut.removeFromParent()
            TimerTut2.removeFromParent()
            
            addChild(figZombie)
            addChild(ZombieTut)
             addChild(ZombieTut2)
            
            Tut3 = false
            
        }
        
        if(Tut4){
            
            
            
            figZombie.removeFromParent()
            ZombieTut.removeFromParent()
            ZombieTut2.removeFromParent()
            
            addChild(figHealth)
            addChild(HealthTut)
             addChild(HealthTut2)
            
            
            Tut4 = false
        }
        
        if(Tut5){
            
          
            
            figHealth.removeFromParent()
            HealthTut.removeFromParent()
            HealthTut2.removeFromParent()

            
            addChild(figKill)
            addChild(KillTut)
            addChild(KillTut2)
            addChild(KillTut3)
            
            Tut5 = false
           
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
}



// -----------------------------------  THE END ---------------------------------------------------
