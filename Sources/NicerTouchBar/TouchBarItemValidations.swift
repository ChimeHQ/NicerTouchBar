//
//  TouchBarItemValidations.swift
//  NicerTouchBar
//
//  Created by Matt Massicotte on 2018-12-16.
//  Copyright © 2018 Chime Systems. All rights reserved.
//

import Cocoa

public protocol TouchBarItemValidations {
    @available(OSX 10.12.2, *)
    func validateTouchBarItem(_ item: NSTouchBarItem) -> Bool
}
