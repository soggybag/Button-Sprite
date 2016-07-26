//
//  ButtonNode.swift
//  Button Sprite
//
//  Created by mitchell hudson on 7/20/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//



/*
 
 Simple button class that supports image states for Normal, Active, and disabled
 states. The ButtonNode class defines three textures which it displays as the 
 button enters it's various states. 
 
 Initialize a ButtonNode with the names of images to use as the Normal, Active, 
 and Disabled states. 
 
 */



import Foundation
import SpriteKit


enum ButtonState {
    case Active
    case Normal
    case Disabled
}


class ButtonNode: SKSpriteNode {
    let normal: SKTexture
    let active: SKTexture
    let disabled: SKTexture
    
    var selectedHandler: () -> Void = { print("No button action set") }
    
    func setButtonState() {
        switch state {
        case .Normal:
            texture = normal
            userInteractionEnabled = true
            
        case .Active:
            texture = active
            
        case .Disabled:
            texture = disabled
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
        normal = SKTexture(imageNamed: normalImageNamed)
        active = SKTexture(imageNamed: activeImageNamed)
        disabled = SKTexture(imageNamed: disabledImageNamed)
        
        super.init(texture: normal, color: UIColor.clearColor(), size: normal.size())
        
        userInteractionEnabled = true
        
        state = .Normal
        setButtonState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
