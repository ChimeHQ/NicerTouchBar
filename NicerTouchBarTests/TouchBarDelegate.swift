//
//  TouchBarDelegate.swift
//  NicerTouchBarTests
//
//  Created by Matt Massicotte on 2019-10-31.
//  Copyright © 2019 Chime Systems. All rights reserved.
//

import Cocoa
import NicerTouchBar

extension NSTouchBarItem.Identifier {
    static let testItem1 = NSTouchBarItem.Identifier("com.chimehq.NicerTouchBar.test-item-1")
}

class TouchBarDelegate: NSObject, NSTouchBarProvider {
    var touchBar: NSTouchBar?

    var validationHandler: ((NSTouchBarItem) -> Bool)?

    @objc func testAction1(_ sender: Any?) {

    }
}

extension TouchBarDelegate: NSTouchBarDelegate {
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        switch identifier {
        case .testItem1:
            let item = NSCustomTouchBarItem(identifier: identifier)

            item.customizationLabel = "button customization label"
            item.view = NSButton(title: "hello", target: self, action: #selector(testAction1(_:)))

            return item
        default:
            return nil
        }
    }
}

extension TouchBarDelegate: TouchBarItemValidations {
    func validateTouchBarItem(_ item: NSTouchBarItem) -> Bool {
        return validationHandler?(item) ?? true
    }
}
