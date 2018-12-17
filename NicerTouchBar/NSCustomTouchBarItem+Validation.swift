//
//  NSCustomTouchBarItem+Validation.swift
//  NicerTouchBar
//
//  Created by Matt Massicotte on 2018-12-16.
//  Copyright © 2018 Chime Systems. All rights reserved.
//

import Cocoa

@available(OSX 10.12.2, *)
extension NSCustomTouchBarItem {
    var control: NSControl? {
        return view as? NSControl
    }

    override public var action: Selector? {
        return control?.action
    }

    override public var tag: Int {
        return control?.tag ?? 0
    }
}

@available(OSX 10.12.2, *)
extension NSCustomTouchBarItem {
    private var validator: AnyObject? {
        guard let action = self.action else {
            return nil
        }

        let target = control?.target

        return NSApplication.shared.target(forAction: action, to: target, from: self) as AnyObject?
    }

    func update() {
        guard let control = control else {
            return
        }

        switch validator {
        case let v as TouchBarItemValidations:
            control.isEnabled = v.validateTouchBarItem(self)
        case let v as NSUserInterfaceValidations:
            control.isEnabled = v.validateUserInterfaceItem(self)
        default:
            break
        }
    }
}
