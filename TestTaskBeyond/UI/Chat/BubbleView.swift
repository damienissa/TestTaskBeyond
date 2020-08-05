//
//  BubbleView.swift
//  TestTaskBeyond
//
//  Created by Dima Virych on 05.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import SwiftUI

struct BubbleView: View {
    
    // MARK - Properties
    
    @State var text: String
    
    @State private var opacity: Double = 0
    
    private let bubleShadow = Constants.Shadow.bubleShadow
    private let width = UIScreen.main.bounds.width
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Image("MessageBubble")
                    .renderingMode(.template)
                    .foregroundColor(Constants.Colors.bubbleColor)
                    .shadow(color: bubleShadow.shadowColor, radius: bubleShadow.blur, x: bubleShadow.x, y: bubleShadow.y)
                    .padding(.leading, -10)
                Text(text)
                    .padding()
                    .layoutPriority(100)
            }
            Spacer()
        }
        .opacity(opacity)
        .onAppear {
            withAnimation(.linear(duration: Constants.animationTimeInterval)) {
                self.opacity = 1
            }
        }
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            BubbleView(text: "So how can I ever try to be better?\nNobody ever lets me in\nI can still see you.\nThis ain't the best view\nOn the outside looking in\nAnd I've been a lot of lonely places\nI've never been on the outside").padding(20).previewLayout(.sizeThatFits)
            BubbleView(text: "So?").padding(20).previewLayout(.sizeThatFits)
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 375, height: 120)
                BubbleView(text: "small text").padding(20)
            }.previewLayout(.sizeThatFits)
        }
    }
}
