//
//  AnimeRepositoryTestCase.swift
//  Tests iOS
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import XCTest
import Combine
@testable import my_anime

class AnimeRepositoryTestCase: XCTestCase {
    var subscriptions = Set<AnyCancellable>()
    
    override func tearDown() {
        subscriptions.removeAll()
    }
    
    func testFetchAnimeList() {
        let repository: AnimeRepository = MockAnimeRepository()
        let fetchExpectation = expectation(description: "fetch")
        
        repository.fetch().sink { completion in
            switch completion{
            case .finished:
                break
            case .failure(let error):
                XCTAssertNil(error)
            }
        } receiveValue: { animes in
            XCTAssertNotNil(animes)
            fetchExpectation.fulfill()
        }.store(in: &subscriptions)
        
        waitForExpectations(timeout: 1)
    }

}
