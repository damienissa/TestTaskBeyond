//
//  Message.swift
//  TestTaskBeyond
//
//  Created by Dima Virych on 05.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import Foundation

public struct Message {
    
    public let id: String
    public let text: String
    
    public init(_ id: String, text: String) {
        
        self.id = id
        self.text = text
    }
}
