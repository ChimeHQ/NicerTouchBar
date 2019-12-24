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
    static let testCustomItem = NSTouchBarItem.Identifier("com.chimehq.NicerTouchBar.test-custom-item")
    static let testPopoverItem = NSTouchBarItem.Identifier("com.chimehq.NicerTouchBar.test-popover-item")
}

class TouchBarDelegate: NSObject, NSTouchBarProvider {
    var touchBar: NSTouchBar?
    var popoverTouchBar: NSTouchBar?

    var validationHandler: ((NSTouchBarItem) -> Bool)?

    @objc func testCustomItemAction(_ sender: Any?) {

    }
}

extension TouchBarDelegate: NSTouchBarDelegate {
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        switch identifier {
        case .testCustomItem:
            let item = NSCustomTouchBarItem(identifier: identifier)

            item.customizationLabel = "button customization label"
            item.view = NSButton(title: "hello", target: self, action: #selector(testCustomItemAction(_:)))

            return item
        case .testPopoverItem:
            let item = NSPopoverTouchBarItem(identifier: identifier)

            if let popoverBar = popoverTouchBar {
                item.popoverTouchBar = popoverBar
            }

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
