//
//  ButtonNode.swift
//  Button Sprite
//
//  Created by mitchell hudson on 7/20/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation
import SpriteKit


enum ButtonState {
    case Active
    case Normal
    case Disabled
}


class ButtonNode: SKNode {
    let normalSprite: SKSpriteNode
    let activeSprite: SKSpriteNode
    let disabledSprite: SKSpriteNode
    
    var selectedHandler: () -> Void = { print("No button action set") }
    
    
    
    func setButtonState() {
        normalSprite.hidden = true
        activeSprite.hidden = true
        disabledSprite.hidden = true
        
        switch state {
        case .Normal:
            normalSprite.hidden = false
            userInteractionEnabled = true
            
        case .Active:
            activeSprite.hidden = false
            
        case .Disabled:
            disabledSprite.hidden = false
            userInteractionEnabled = false
            
        }
    }
    
    var state: ButtonState = ButtonState.Normal {
        didSet {
            setButtonState()
        }
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        state = .Active
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        state = .Normal
        selectedHandler()
    }
    
    
    
    init(normalImageNamed: String, activeImageNamed: String, disabledImageNamed: String) {
        normalSprite = SKSpriteNode(imageNamed: normalImageNamed)
        activeSprite = SKSpriteNode(imageNamed: activeImageNamed)
        disabledSprite = SKSpriteNode(imageNamed: disabledImageNamed)
        
        super.init()
        
        addChild(normalSprite)
        addChild(activeSprite)
        addChild(disabledSprite)
        
        userInteractionEnabled = true
        
        state = .Normal
        setButtonState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
