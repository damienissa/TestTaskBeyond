//
//  MainView.swift
//  TestTaskBeyond
//
//  Created by Dima Virych on 05.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @State var chatService: ChatService
    @State var speechService: SpeechService
    
    var body: some View {
        ChatView(viewModel: .init(LocalChatService(), speechService: AVSpeechService()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(chatService: LocalChatService(), speechService: FakeSpeechService())
    }
}
