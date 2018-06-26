//
//  designedButton.swift
//  quizzVerbs
//
//  Created by misael rivera on 20/05/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
@IBDesignable

class designedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        designedBtn()
    }
    override func prepareForInterfaceBuilder() {
        designedBtn()
    }
    
    func designedBtn(){
        layer.masksToBounds = false
        layer.cornerRadius = 8.0
        layer.shadowColor = UIColor.black.withAlphaComponent(1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 1.0
    }
}
