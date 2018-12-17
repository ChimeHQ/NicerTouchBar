//
//  NSWindowController+Binding.swift
//  NicerTouchBar
//
//  Created by Matt Massicotte on 2018-12-16.
//  Copyright © 2018 Chime Systems. All rights reserved.
//

import Cocoa

public extension NSViewController {
    public func restoreParentWindowTouchBar() {
        if #available(OSX 10.12.2, *) {
            view.window?.unbind(NSBindingName(rawValue: #keyPath(touchBar)))
        }
    }

    public func becomeParentWindowTouchBarProvider() {
        restoreParentWindowTouchBar()

        if #available(OSX 10.12.2, *) {
            view.window?.bind(NSBindingName(rawValue: #keyPath(touchBar)),
                              to: self,
                              withKeyPath: #keyPath(touchBar), options: nil)
        }
    }
}
