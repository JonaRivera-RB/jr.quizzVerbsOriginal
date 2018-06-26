//
//  desginedView.swift
//  quizzVerbs
//
//  Created by misael rivera on 22/05/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
@IBDesignable

class desginedView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designedView()
    }
    override func prepareForInterfaceBuilder() {
        designedView()
    }
    func designedView(){
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor.black.withAlphaComponent(1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 1
    }
}
