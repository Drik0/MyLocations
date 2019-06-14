//
//  HudView.swift
//  MyLocations
//
//  Created by Gerson Costa on 13/06/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import UIKit

class HudView: UIView {
    var text = ""
    
    class func hud(inView view: UIView, animated: Bool) -> HudView {
        let hudView = HudView(frame: view.bounds)
        hudView.isOpaque = false
        
        view.addSubview(hudView)
        view.isUserInteractionEnabled = false
        
        //hudView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        
        return hudView
    }
    
    override func draw(_ rect: CGRect) {
        // HUD Rectangle
        let boxWidth: CGFloat = 96
        let boxHeight: CGFloat = 96
        
        let boxRect = CGRect(
                x: round((bounds.size.width - boxWidth) / 2),
                y: round((bounds.size.height - boxHeight) / 2),
                width: boxWidth,
                height: boxHeight)
        
        let roundedRect = UIBezierPath(roundedRect: boxRect, cornerRadius: 10)
        
        UIColor(white: 0.3, alpha: 0.8).setFill()
        roundedRect.fill()
        
        // HUD Checkmark Image
        if let image = UIImage(named: "Checkmark") {
            let imagePoint = CGPoint(
                x: center.x - round(image.size.width / 2),
                y: center.y - round(image.size.height / 2) - boxHeight / 8)
            image.draw(at: imagePoint)
        }
        
        // HUD Text
        let attribs = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor.white]
        
        let textSize = text.size(withAttributes: attribs)
        
        let textPoint = CGPoint(
            x: center.x - round(textSize.width / 2),
            y: center.y - round(textSize.height / 2) + boxHeight / 4)
        text.draw(at: textPoint, withAttributes: attribs)
    }
}