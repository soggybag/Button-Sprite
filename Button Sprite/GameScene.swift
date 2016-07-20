//
//  GameScene.swift
//  Button Sprite
//
//  Created by mitchell hudson on 7/20/16.
//  Copyright (c) 2016 mitchell hudson. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    func loadScene(name: String) {
        
    }
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        let button = ButtonNode(normalImageNamed: "Button-normal", activeImageNamed: "Button-active", disabledImageNamed: "Button-disabled")
        
        addChild(button)
        button.position.x = view.frame.width / 2
        button.position.y = view.frame.height / 2
        
        button.selectedHandler = {
            print("Button Tapped!!!!!")
            button.state = .Disabled
        }
        
        let b2 = ButtonNode(normalImageNamed: "Button-normal", activeImageNamed: "Button-active", disabledImageNamed: "Button-disabled")
        
        addChild(b2)
        b2.position.x = view.frame.width / 2
        b2.position.y = view.frame.height / 2 - 100
        
        b2.selectedHandler = {
            print("Enables button 1")
            button.state = .Normal
        }
        
        /*
        let testScene = SKScene(fileNamed: "TestScene")!
        let container = testScene.childNodeWithName("container")!
        container.removeFromParent()
        addChild(container)
        */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
