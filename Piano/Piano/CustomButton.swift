//
//  CustomButton.swift
//  Piano
//
//  Created by Maor Shams on 16/03/2017.
//  Copyright © 2017 Maor Shams. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    // setup
    required init?(coder aDecoder: NSCoder) {//from storyboard
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) { //from code
        super.init(frame: frame)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    private func setup(){
        layer.borderColor = UIColor.black.cgColor
    }
    
    // button design
    @IBInspectable var borderColor : UIColor? = nil{
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 1{
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    // track user events
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        self.isHighlight(true)
        return super.beginTracking(touch, with: event)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        self.isHighlight(false)
        super.endTracking(touch, with: event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        self.isHighlight(false)
        super.cancelTracking(with: event)
    }
    
    // button change border when click
    private func isHighlight(_ h : Bool){
        self.layer.borderWidth = h ? 3 : 1
    }
}
