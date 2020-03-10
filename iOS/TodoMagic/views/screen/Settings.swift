//
//  Settings.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/07.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var appStore: AppStore

    let settings = [
        SettingsModel(group: "Info", items: [
            SettingsItem(title: "Version", text: "1.0.0")
        ]),
        SettingsModel(group: "Others", items: [
            SettingsItem(title: "Back to welcome")
        ])
    ]

    var body: some View {
        NavigationView{
            List{
                ForEach(settings) { setting in
                    Section(header: Text(setting.group)) {
                        ForEach(setting.items) { item in
                            SettingsRow(
                                settings: item,
                                pressed: {
                                    if (item.title == "Back to welcome") {
                                        withAnimation {
                                            self.appStore.changeScreen(screenName: "Welcome")
                                        }
                                    }
                                }
                            )
                        }
                    }
                }
            }
            .navigationBarTitle(Text("SETTINGS"))
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
