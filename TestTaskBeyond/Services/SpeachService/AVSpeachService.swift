//
//  AVSpeechService.swift
//  TestTaskBeyond
//
//  Created by Dima Virych on 05.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import AVFoundation

public final class AVSpeechService: NSObject {
    
    private let synthesizer = AVSpeechSynthesizer()
    private var completion: (() -> Void)!
    
    public override init() {
        super.init()
        
        synthesizer.delegate = self
    }
}


// MARK: - SpeechService

extension AVSpeechService: SpeechService {
    
    public func speech(text: String, completion: @escaping () -> Void) {
        
        self.completion = completion
        
        synthesizer.speak(AVSpeechUtterance(string: text))
    }
}


// MARK: -

extension AVSpeechService: AVSpeechSynthesizerDelegate {
    
    public func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        
        completion()
    }
}
