//
//  UITableViewCell.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 28/2/21.
//

import UIKit
import Lottie

extension UITableViewCell{
    
    func setProgressCircleBar(frameAnimationview: UIView, endFrame :CGFloat){
        
        var animationView: AnimationView
        
        animationView = .init(name: "progresscircle_color")
        animationView.frame = frameAnimationview.bounds
        
        animationView.contentMode = .scaleAspectFit
        
        animationView.loopMode = .playOnce
        
        animationView.animationSpeed = 5
        
        frameAnimationview.addSubview(animationView)

        animationView.play(fromFrame: 0, toFrame: endFrame, loopMode: .none)
        }
}
