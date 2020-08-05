//
//  LocalChatServiceTests.swift
//  TestTaskBeyondTests
//
//  Created by Dima Virych on 05.08.2020.
//  Copyright © 2020 Beyond Expression LLC. All rights reserved.
//

import XCTest
import TestTaskBeyond

class LocalChatServiceTests: XCTestCase {

    func test_localDataLoading() {
        
        let sut = makeSUT()
        
        XCTAssertEqual(sut.getMessages().count, 9)
    }
}


// MARK: - Helpers

extension LocalChatServiceTests {
    
    func makeSUT() -> ChatService {
        LocalChatService()
    }
}
