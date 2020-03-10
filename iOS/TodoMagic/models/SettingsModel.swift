//
//  SettingsModel.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/07.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import Foundation


struct SettingsItem: Identifiable {
    var id = UUID()
    var title: String
    var text: String? = ""
}

struct SettingsModel: Identifiable {
    var id = UUID()
    var group: String
    var items: [SettingsItem]
}
