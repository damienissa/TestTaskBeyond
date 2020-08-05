//
//  SpeechService.swift
//  TestTaskBeyond
//
//  Created by Dima Virych on 05.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import Foundation

public protocol SpeechService {
    
    func speech(text: String, completion: @escaping () -> Void)
}
