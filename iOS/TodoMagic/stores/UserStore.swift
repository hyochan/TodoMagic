//
//  UserStore.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/16.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import Foundation
import Combine

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

final class UserSettings: ObservableObject {

    let objectWillChange = PassthroughSubject<Void, Never>()

    @UserDefault("ShowOnStart", defaultValue: true)
    var showOnStart: Bool {
        willSet {
            objectWillChange.send()
        }
    }
}
