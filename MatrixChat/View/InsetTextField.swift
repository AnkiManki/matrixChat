//
//  InsetTextField.swift
//  MatrixChat
//
//  Created by Stefan Markovic on 8/16/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {
    
    
    override func awakeFromNib() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        self.attributedPlaceholder = placeholder
        super.awakeFromNib()
    }

    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    //this is where text is held
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    //editing text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    //placeholder text
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }

    
}
