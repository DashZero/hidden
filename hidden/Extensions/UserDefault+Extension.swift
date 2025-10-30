//
//  UserDefault+Extension.swift
//  Hidden Bar
//
//  Created by phucld on 12/18/19.
//  Copyright © 2019 Dwarves Foundation. All rights reserved.
//

import Foundation

extension UserDefaults {
    enum Key {
        static let globalKey = "globalKey"
        static let numberOfSecondForAutoHide = "numberOfSecondForAutoHide"
        static let isAutoStart = "isAutoStart"
        static let isAutoHide = "isAutoHide"
        static let isShowPreference = "isShowPreferences"
        static let areSeparatorsHidden = "areSeparatorsHidden"
        static let alwaysHiddenSectionEnabled = "alwaysHiddenSectionEnabled"
        static let useFullStatusBarOnExpandEnabled = "useFullStatusBarOnExpandEnabled"
        static let keepInDock = "keepInDock"
    }
    
    /// Observe any change to UserDefaults. Returns an opaque token you should retain as long as you want to observe.
    /// - Parameters:
    ///   - queue: The queue on which the handler will be called. Defaults to main.
    ///   - handler: Called when UserDefaults posts `didChangeNotification`.
    /// - Returns: An opaque `AnyObject` token. Retain it to keep observing; pass it to `removeObserver(_:)` to stop.
    @discardableResult
    static func observeChanges(queue: OperationQueue? = .main, handler: @escaping (Notification) -> Void) -> AnyObject {
        let center = NotificationCenter.default
        let token = center.addObserver(forName: UserDefaults.didChangeNotification, object: nil, queue: queue, using: handler)
        return token as AnyObject
    }

    /// Stop observing changes using the token returned from `observeChanges`.
    static func removeObserver(_ token: AnyObject) {
        NotificationCenter.default.removeObserver(token)
    }

    /// Convenience: Observe changes for a specific key by filtering the notification.
    /// Note: `UserDefaults.didChangeNotification` does not include which key changed. This method
    /// re-reads the current value and compares with a cached value you provide to detect changes.
    /// - Parameters:
    ///   - key: The key to monitor.
    ///   - initialValue: The initial value to compare against. Provide the current value when you start observing.
    ///   - queue: The queue for the handler. Defaults to main.
    ///   - handler: Called when the value appears to change. Provides old and new values.
    /// - Returns: A tuple containing the token and a closure to update the cached value if you mutate it elsewhere.
    static func observeValueChange<T: Equatable>(forKey key: String,
                                                 initialValue: T?,
                                                 queue: OperationQueue? = .main,
                                                 handler: @escaping (_ oldValue: T?, _ newValue: T?) -> Void) -> (token: AnyObject, updateCache: (_ newValue: T?) -> Void) {
        var cached = initialValue
        let token = observeChanges(queue: queue) { _ in
            let newValue = UserDefaults.standard.object(forKey: key) as? T
            if newValue != cached {
                let old = cached
                cached = newValue
                handler(old, newValue)
            }
        }
        let updateCache: (_ newValue: T?) -> Void = { newVal in
            cached = newVal
        }
        return (token, updateCache)
    }
}
