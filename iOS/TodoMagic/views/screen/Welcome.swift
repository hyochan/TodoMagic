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
    @ObservedObject var settings = UserSettings()
    @State var showOnStart = true
    @State private var todos: [TodoModel] = []

    var body: some View {
        ZStack {
            Color("primary")
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                Image("AppLogo")
                Text("APP_DESCRIPTION")
                    .padding(.top, 48)
                    .padding(.horizontal, 40)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                Spacer()
                Button(
                    action: {
                        let url: NSURL = URL(string: "https://github.com/hyochan/todomagic")! as NSURL
                        UIApplication.shared.open(url as URL)
                    }
                ) {
                    Text("GO_TO_REPOSITORY")
                        .font(.system(size: 20))
                        .foregroundColor(.yellow)
                        .fontWeight(.bold)
                        .underline()
                }
                Button(
                    action: {
                        self.showOnStart = !self.showOnStart
                    }
                ) {
                    HStack {
                        Image(systemName: !self.showOnStart ? "checkmark.square" : "square")
                        .foregroundColor(.white)
                        Text("DO_NOT_SEE_AGAIN")
                        .foregroundColor(.white)
                    }
                }
                .padding(.vertical, 16)
                Button(
                    action: {
                        withAnimation {
                            self.appStore.changeScreen(screenName: "HomeTab")
                            self.settings.showOnStart = self.showOnStart
                        }
                    }
                ) {
                    Text("CLICK_TO_PROCEED")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.horizontal, 20)
                        .background(Color(red: 255, green: 255, blue: 255, opacity: 0.0032))
                        .foregroundColor(Color("primary"))
                        .border(Color.white, width: 1)
                        .animation(.interactiveSpring())
                }
            }
            .padding(.vertical, 60)
            .padding(.top, 80)
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
