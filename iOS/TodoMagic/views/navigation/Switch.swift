//
//  Switch.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/07.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct Switch: View {
    @EnvironmentObject var appStore: AppStore
    @ObservedObject var settings = UserSettings()

    var body: some View {
        ZStack {
            if (appStore.currentScreen == "Welcome") {
                Welcome()
            } else {
                HomeTab().transition(.move(edge: .trailing))
            }
        }
        .transition(.move(edge: .bottom))
        .onAppear() {
            if (self.settings.showOnStart) {
                self.appStore.currentScreen = "Welcome"
            } else {
                self.appStore.currentScreen = "HomeTab"
            }
        }
    }
}

struct Switch_Previews: PreviewProvider {
    static var previews: some View {
        Switch()
    }
}
