//
//  Message.swift
//  MatrixChat
//
//  Created by Stefan Markovic on 8/17/17.
//  Copyright © 2017 Stefan Markovic. All rights reserved.
//

import Foundation

class Message {
    
    private var _content: String
    private var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
    
    
}
