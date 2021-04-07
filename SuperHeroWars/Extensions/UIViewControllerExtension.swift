//
//  UIViewController.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 28/2/21.
//

import UIKit
import Lottie

extension UIViewController{
    
    func setProgressCircleBar(frameAnimationview: UIView, endFrame :CGFloat){
        
        var animationView: AnimationView
        
        animationView = .init(name: "progresscircle_color")
        animationView.frame = frameAnimationview.bounds
        
        animationView.contentMode = .scaleAspectFit
        
        animationView.loopMode = .playOnce
        
        animationView.animationSpeed = 2
        
        frameAnimationview.addSubview(animationView)
        
        animationView.play(fromFrame: 0, toFrame: endFrame, loopMode: .none)
    }
    
    
    func showFilter (style: UIAlertController.Style,
                    title: String,
                    message: String,
                    filterAll: ((UIAlertAction) -> Void)? = nil,
                    filterGood:((UIAlertAction) -> Void)? = nil,
                    filterNeutral:((UIAlertAction) -> Void)? = nil,
                    filterBad:((UIAlertAction) -> Void)? = nil){
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: style)   //El estilo
        
        alert.addAction(UIAlertAction(title: "All",
                                      style: .default,
                                      handler: filterAll))
        
        alert.addAction(UIAlertAction(title: "Good",
                                      style: .default,
                                      handler: filterGood))
        
        alert.addAction(UIAlertAction(title: "Neutral",
                                      style: .default,
                                      handler: filterNeutral))
        
        
        alert.addAction(UIAlertAction(title: "Bad",
                                      style: .default,
                                      handler: filterBad))
        
        present(alert, animated : true)
        
        
    }
    
    
    
    func showResultFight (style: UIAlertController.Style,
                    title: String,
                    message: String,
                    onAccept: ((UIAlertAction) -> Void)? = nil){
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: style)   //El estilo
        alert.addAction(UIAlertAction(title: "Finish",
                                      style: .default,
                                      handler: onAccept))
        present(alert, animated : true)
    }
    
    
    func showAlert (style: UIAlertController.Style,
                    title: String,
                    message: String,
                    onAccept: ((UIAlertAction) -> Void)? = nil){
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: style)   //El estilo
        alert.addAction(UIAlertAction(title: "Back",
                                      style: .destructive,
                                      handler: onAccept))
        present(alert, animated : true)
    }
  
    
}
