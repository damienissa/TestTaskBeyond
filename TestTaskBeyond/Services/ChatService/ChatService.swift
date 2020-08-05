//
//  ChatService.swift
//  TestTaskBeyond
//
//  Created by Dima Virych on 05.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import Foundation

public protocol ChatService {
    
    func getMessages() -> [Message]
}
