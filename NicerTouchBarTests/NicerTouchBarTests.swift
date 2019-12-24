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
    func testTouchBarCustomItemValidation() {
        let delegate = TouchBarDelegate()

        let touchBar = NSTouchBar()
        touchBar.delegate = delegate
        touchBar.defaultItemIdentifiers = [.testCustomItem]

        var validatedItem: NSTouchBarItem?

        delegate.validationHandler = { (item) in
            validatedItem = item

            return true
        }

        touchBar.validate()

        XCTAssertEqual(validatedItem?.identifier, .testCustomItem)
    }

    func testTouchBarPopoverValidation() {
        let popoverDelegate = TouchBarDelegate()
        let popoverTouchBar = NSTouchBar()

        popoverTouchBar.defaultItemIdentifiers = [.testCustomItem]
        popoverTouchBar.delegate = popoverDelegate

        var validatedItems = [NSTouchBarItem]()

        popoverDelegate.validationHandler = { (item) in
            validatedItems.append(item)

            return true
        }

        let delegate = TouchBarDelegate()
        delegate.popoverTouchBar = popoverTouchBar
        
        let touchBar = NSTouchBar()

        touchBar.delegate = delegate
        touchBar.defaultItemIdentifiers = [.testPopoverItem]

        delegate.validationHandler = { (item) in
            validatedItems.append(item)

            return true
        }

        touchBar.validate()

        XCTAssertEqual(validatedItems.count, 1)
        XCTAssertEqual(validatedItems[0].identifier, .testCustomItem)
    }
}
