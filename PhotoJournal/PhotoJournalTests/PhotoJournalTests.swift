//
//  PhotoJournalTests.swift
//  PhotoJournalTests
//
//  Created by Kimball Yang on 9/27/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import XCTest
@testable import PhotoJournal

class PhotoJournalTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetJournal() {
        do {
        let journalTest = try PhotoPersistenceManager.manager.getJournal()
            XCTAssert(journalTest.count > 0)
        }
        catch {
            print(error)
        }
        }
    }


