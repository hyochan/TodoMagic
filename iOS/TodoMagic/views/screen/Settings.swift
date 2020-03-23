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
    @ObservedObject var userSettings = UserSettings()

    let settings = [
        SettingsModel(
            group: NSLocalizedString("INFO", comment: "Info"),
            items: [
                SettingsItem(
                    title: NSLocalizedString("VERSION", comment: "Version"),
                    text: "1.0.0"
                )
            ]
        ),
        SettingsModel(
            group: NSLocalizedString("OTHERS", comment: "Others"),
            items: [
                SettingsItem(
                    title: NSLocalizedString("ABOUT_ME", comment: "About me"),
                    type: SettingType.ABOUT_ME
                ),
                SettingsItem(
                    title: NSLocalizedString("BACK_TO_INTRO", comment: "Back to intro"),
                    type: SettingType.BACK_TO_INTRO
                )
            ]
        )
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
                                    if (item.type == SettingType.ABOUT_ME) {
                                        let url: NSURL = URL(string: "https://github.com/hyochan")! as NSURL
                                        UIApplication.shared.open(url as URL)
                                    }
                                    else if (item.type == SettingType.BACK_TO_INTRO) {
                                        withAnimation {
                                            self.userSettings.showOnStart = true
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
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
