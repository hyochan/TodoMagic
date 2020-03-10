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
    // Resetting screen issue (Switching screens)
    // https://stackoverflow.com/questions/57334455/swiftui-how-to-pop-to-root-view/57513566#57513566
    
    // Navigating with animation
    // https://stackoverflow.com/questions/58908741/how-do-i-add-animations-to-transitons-between-custom-navigationitems-made-from-a/59087574#59087574

    var body: some View {
        ZStack {
            if (appStore.currentScreen == "Welcome") {
                Welcome()
            } else {
                HomeTab().transition(.move(edge: .trailing))
            }
        }.transition(.move(edge: .bottom))
    }
}

struct Switch_Previews: PreviewProvider {
    static var previews: some View {
        Switch()
    }
}
