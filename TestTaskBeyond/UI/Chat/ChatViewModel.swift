//
//  ChatViewModel.swift
//  TestTaskBeyond
//
//  Created Dima Virych on 05.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import Combine
import Foundation

public final class ChatViewModel: ObservableObject {
    
    // MARK: - Model
    
    public struct MessageUIModel: Identifiable {
        
        public let id: String
        public let text: String
    }
    
    
    // MARK: - Properties
    
    @Published public var messages: [MessageUIModel] = []
    
    
    // MARK: - Private properties
    
    private let chatService: ChatService
    private let speechService: SpeechService
    
    private var currentMessageIndex = 0
    private var messagesFromService: [Message] = []
    
    
    // MARK: - Lifecycle
    
    init(_ chatService: ChatService, speechService: SpeechService) {
        
        self.chatService = chatService
        self.speechService = speechService
    }
    
    
    // MARK: - Actions
    
    public func startReceivingMessages() {
        
        loadMessages()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationTimeInterval) { [weak self] in

            self?.proccessMessage()
        }
    }
    
    private func loadMessages() {
        
        messagesFromService = chatService.getMessages()
    }
    
    private func proccessMessage() {
        
        if currentMessageIndex >= messagesFromService.count {
            return
        }
        let message = messagesFromService[currentMessageIndex]
        messages.append(.init(id: message.id, text: message.text))
        
        speechMessage(message) {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationTimeInterval) { [weak self] in
                self?.currentMessageIndex += 1
                self?.proccessMessage()
            }
        }
    }
    
    private func speechMessage(_ message: Message, completion: @escaping () -> Void) {
        
        speechService.speech(text: message.text, completion: completion)
    }
}
