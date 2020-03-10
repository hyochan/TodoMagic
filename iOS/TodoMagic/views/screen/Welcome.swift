//
//  Welcome.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/07.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct Welcome: View {
    @EnvironmentObject var appStore: AppStore

    var body: some View {
        VStack {
            Button(
                action: {
                    withAnimation {
                      self.appStore.changeScreen(screenName: "HomeTab")
                    }
                }
            ) {
                Text("Welcome!\nClick to proceed")
                    .fontWeight(.bold)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .padding(10)
                    .border(Color.purple, width: 5)
                    .animation(.interactiveSpring())
            }
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
