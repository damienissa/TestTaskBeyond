//
//  ChatView.swift
//  TestTaskBeyond
//
//  Created Dima Virych on 05.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import SwiftUI

public struct ChatView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: ChatViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: ChatViewModel) {
        
        self.viewModel = viewModel
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
    }
    
    
    // MARK: - Body
    
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                Constants.Colors.appBackGroundColor
                List(self.viewModel.messages.reversed()) { message in
                    
                    HStack {
                        Spacer()
                        BubbleView(text: message.text)
                            .frame(maxWidth: proxy.size.width * Constants.bubbleMaxWidthConst, maxHeight: .infinity)
                            
                            .rotationEffect(.degrees(180))
                    }
                    .frame(width: proxy.size.width - 30)
                    .padding(.vertical, Constants.spaceBetweenBubbles / 2)
                }
                
            }
            .rotationEffect(.degrees(180))
            .onAppear {
                self.viewModel.startReceivingMessages()
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    
    static var previews: some View {
        ChatView(viewModel: .init(LocalChatService(), speechService: FakeSpeechService()))
    }
}
