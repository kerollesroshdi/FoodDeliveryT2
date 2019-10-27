//
//  AnimationsFactory.swift
//  FoodDelivery
//
//  Created by Osama on 10/27/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

class AnimationsFactory {
    
    enum Animations {
        case glow(from: Float)
    }
    
    static func animate(_ view: UIView, animationType: Animations){
        let animation = self.animation(for: animationType)
        view.layer.add(animation, forKey: nil)
    }
    
    private static func animation(for animationType: Animations) -> CABasicAnimation{
        switch animationType {
        case .glow(let from):
            
            let popAnimation = CASpringAnimation(keyPath: "transform.scale")
            popAnimation.fromValue = from
            popAnimation.toValue = 1
            popAnimation.duration = 10
            return popAnimation
        }
    }
}
