//
//  NSTouchBar+Validation.swift
//  NicerTouchBar
//
//  Created by Matt Massicotte on 2018-12-16.
//  Copyright © 2018 Chime Systems. All rights reserved.
//

import Cocoa

@available(OSX 10.12.2, *)
public extension NSTouchBar {
    public func validate() {
        validateItems()
    }

    private func validateItems() {
        let items = itemIdentifiers.compactMap { item(forIdentifier: $0) }

        items.forEach { (item) in
            switch item {
            case let i as NSCustomTouchBarItem:
                i.update()
            case let i as NSGroupTouchBarItem:
                i.update()
            case let i as NSPopoverTouchBarItem:
                i.update()
            default:
                break
            }
        }
    }
}
