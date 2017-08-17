//
//  ShadowView.swift
//  MatrixChat
//
//  Created by Stefan Markovic on 8/17/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }


}
