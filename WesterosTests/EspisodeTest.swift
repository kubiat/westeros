//
//  EspisodeTest.swift
//  WesterosTests
//
//  Created by Joaquín Gracia López on 28/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {
    
    var season1: Season!
    var episode1x1: Episode!
    var episode1x2: Episode!
    var dateFormatetter: DateFormatter!
    
    override func setUp() {
        dateFormatetter = DateFormatter()
        dateFormatetter.dateFormat = "yyyy-MM-dd"
        season1 = Season(name: "Temporada 1", releaseDate: dateFormatetter.date(from: "2011-04-17")!)
        episode1x1 = Episode(name: "1x1 Winter Is Coming", releaseDate: dateFormatetter.date(from: "2011-04-17")!, season: season1)
        episode1x2 = Episode(name: "1x2 The Kingsroad", releaseDate: dateFormatetter.date(from: "2011-04-24")!, season: season1)
    }
    func testEpisodeExistence() {
        XCTAssertNotNil(episode1x1)
    }
    func testEpisodeCustomStringConvertible() {
        XCTAssertNotNil(episode1x1.description)
   
    }
    
    func testSeasonEquatable() {
        // 1. Identidad
        XCTAssertEqual(episode1x1 , episode1x1 )
        // 2. Igualdad
        let episodeTest = Episode(name: "1x1 Winter Is Coming", releaseDate: dateFormatetter.date(from: "2011-04-17")!, season: season1)
        XCTAssertEqual(episodeTest, episode1x1)
        // 3. Desigualdad
        XCTAssertNotEqual(episode1x1, episode1x2)
        
    }
    
    func testEpisodeHashable() {
        XCTAssertNotNil(episode1x1.hashValue)
        XCTAssertNotNil(episode1x2.hashValue)
    }
    func testSeasonComparable() {
        XCTAssertLessThan(episode1x1, episode1x2)
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
}
