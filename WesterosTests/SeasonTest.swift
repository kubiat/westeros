//
//  SeasonTest.swift
//  WesterosTests
//
//  Created by Joaquín Gracia López on 28/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//


import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
    var season1: Season!
    var season2: Season!
    var season3: Season!
    
    var episode1x1: Episode!
    var episode1x2: Episode!
    var episode1x3: Episode!
    
    var episode2x1: Episode!
    var episode2x2: Episode!
    var episode2x3: Episode!
    
    var episode3x1: Episode!
    var episode3x2: Episode!
    var episode3x3: Episode!
  
    var dateFormatetter: DateFormatter!
    
    override func setUp() {
        dateFormatetter = DateFormatter()
        dateFormatetter.dateFormat = "yyyy-MM-dd"
        season1 = Season(name: "Temporada 1", releaseDate: dateFormatetter.date(from: "2011-04-17")!)
        season2 = Season(name: "Temporada 2", releaseDate: dateFormatetter.date(from: "2012-04-01")!)
        season3 = Season(name: "Temporada 3", releaseDate: dateFormatetter.date(from: "2013-03-31")!)
    }
    func testSeasonExistence() {
        XCTAssertNotNil(season1)
        XCTAssertNotNil(season2)
        XCTAssertNotNil(season3)
        
    }
    func testSeasonCustomStringConvertible() {
        XCTAssertNotNil(season1.description)
        XCTAssertNotNil(season2.description)
        XCTAssertNotNil(season3.description)
    }
    
    func testSeasonEquatable() {
        // 1. Identidad
        XCTAssertEqual(season1, season1)
        // 2. Igualdad
        let seasonTest = Season(name: "Temporada 1", releaseDate: dateFormatetter.date(from: "2011-04-17")!)
        XCTAssertEqual(seasonTest, season1)
        // 3. Desigualdad
        XCTAssertNotEqual(season1, season2)
        
    }
    func testSeasonHashable() {
        XCTAssertNotNil(season1.hashValue)
        XCTAssertNotNil(season2.hashValue)
        XCTAssertNotNil(season3.hashValue)
    }
    func testSeasonComparable() {
        XCTAssertLessThan(season1, season2)
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
}

