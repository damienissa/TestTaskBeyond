//
//  FakeSpeachService.swift
//  TestTaskBeyond
//
//  Created by Dima Virych on 06.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import Foundation

public struct FakeSpeechService: SpeechService {
    
    public func speech(text: String, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion()
        }
    }
}
