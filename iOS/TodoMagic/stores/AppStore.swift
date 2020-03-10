//
//  AppStore.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/10.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import Foundation

class AppStore: ObservableObject {
    
    @Published var currentScreen = "Welcome"

    func changeScreen(screenName: String) {
        self.currentScreen = screenName
    }
}
