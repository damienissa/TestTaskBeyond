//
//  LocalChatService.swift
//  TestTaskBeyond
//
//  Created by Dima Virych on 05.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import Foundation

public final class LocalChatService {
    
    // MARK: - Model
    
    private struct LocalChatMessage: Codable {
        
        let id: String
        let line: String
    }
    
    
    // MARK: - Properties
    
    private var messages: [LocalChatMessage] = []
    
    
    // MARK: - Lifecycle
    
    public init() {
        
        loadData()
    }
    
    
    // MARK: - Private Actions
    
    private func loadData() {
        
        if let url = Bundle.main.url(forResource: "ChatMessages", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                messages = try JSONDecoder().decode([LocalChatMessage].self, from: data)
            } catch {
                print(error)
            }
        }
    }
}


// MARK: - ChatService

extension LocalChatService: ChatService {
    
    public func getMessages() -> [Message] {
        
        messages.map {
            Message($0.id, text: $0.line)
        }.filter {
            1...Constants.maximumTextSymbols ~= $0.text.count
        }
    }
}
