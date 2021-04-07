//
//  UIStackViewExtension.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 24/2/21.
//

import UIKit

extension UIStackView{

    func paddingInBiograpghy(){
        self.isLayoutMarginsRelativeArrangement = true
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 4)
    }
    
    func setPadding(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat){
        self.isLayoutMarginsRelativeArrangement = true
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
    
}
