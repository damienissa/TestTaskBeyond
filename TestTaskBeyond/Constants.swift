//
//  Constants.swift
//  TestTaskBeyond
//
//  Created by Dima Virych on 05.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import SwiftUI

public struct Constants {
    
    public static let maximumTextSymbols = 550
    public static let bubbleCornerRadius: CGFloat = 5
    public static let bubbleMaxWidthConst: CGFloat = 0.75
    public static let spaceBetweenBubbles: CGFloat = 30
    public static let animationTimeInterval: TimeInterval = 0.5
    
    public struct Colors {
        
        public static let appBackGroundColor: Color = "F9FAFB"
        public static let bubbleColor: Color = "FDFDFE"
        public static let bubbleShadowColor: Color = "000000"
    }
    
    public struct Shadow {
        
        public let x: CGFloat
        public let y: CGFloat
        public let blur: CGFloat
        public let shadowColor: Color
        
        public static var bubleShadow: Shadow {
            .init(x: 1, y: 1, blur: 2, shadowColor: Colors.bubbleShadowColor)
        }
    }
}
