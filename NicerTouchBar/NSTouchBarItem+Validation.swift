//
//  NSTouchBarItem+Validation.swift
//  NicerTouchBar
//
//  Created by Matt Massicotte on 2018-12-16.
//  Copyright © 2018 Chime Systems. All rights reserved.
//

import Cocoa

@available(OSX 10.12.2, *)
extension NSTouchBarItem : NSValidatedUserInterfaceItem {
    public var action: Selector? {
        return nil
    }

    public var tag: Int {
        return 0
    }
}
