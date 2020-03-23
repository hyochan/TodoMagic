//
//  SettingsRow.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/07.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct SettingsRow: View {
    var settings: SettingsItem
    var pressed: (() -> Void)?

    var body: some View {
        Button(action: {
            if (self.pressed == nil) {
                return
            }
            self.pressed!()
        }) {
            VStack(alignment: .leading) {
                Text(settings.title)
                    .font(.system(size: 18, weight: .bold))
                Text(settings.text ?? "")
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(Color("font"))
            }
        }
    }
}

//struct SettingsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsRow(settings: settings[0].items[0])
//    }
//}
