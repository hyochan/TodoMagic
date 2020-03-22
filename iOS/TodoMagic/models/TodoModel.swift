//
//  File.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/03.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import Foundation

func getFormattedDate(date: Date, format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
}

struct TodoModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var image: String
    var content: String = ""
    var hasChecked: Bool = false
    var selectedDate: Date = Date()
    var createdAt: Date?
    var updatedAt: Date?
}
