//
//  NicerTouchBarTests.swift
//  NicerTouchBarTests
//
//  Created by Matt Massicotte on 2018-12-16.
//  Copyright © 2018 Example. All rights reserved.
//

import XCTest
@testable import NicerTouchBar

class NicerTouchBarTests: XCTestCase {
    func testTouchBarValidation() {
        let delegate = TouchBarDelegate()
        let touchBar = NSTouchBar()
        touchBar.defaultItemIdentifiers = [.testItem1]
        touchBar.delegate = delegate

        var validatedItem: NSTouchBarItem? = nil

        delegate.validationHandler = { (item) in
            validatedItem = item

            return true
        }

        touchBar.validate()

        XCTAssertEqual(validatedItem?.identifier, .testItem1)
    }
}
