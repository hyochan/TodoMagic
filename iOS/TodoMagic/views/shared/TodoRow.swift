//
//  TodoRow.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/05.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct TodoRow: View {
    @EnvironmentObject var todoStore: TodoStore
    var index: Int
    
    func TodoView() -> some View {
        if (self.todoStore.getTodo(index: index).hasChecked) {
            return VStack(alignment: .leading) {
                Text(self.todoStore.getTodo(index: index).title)
                    .strikethrough()
                    .font(.system(size: 20, weight: .bold))
                Text(getFormattedDate(date: self.todoStore.getTodo(index: index).selectedDate, format: "dd-MMM-yyyy"))
                    .strikethrough()
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
        }
        return VStack(alignment: .leading) {
            Text(self.todoStore.getTodo(index: index).title)
                .font(.system(size: 20, weight: .bold))
            Text(getFormattedDate(date: self.todoStore.getTodo(index: index).selectedDate, format: "dd-MMM-yyyy"))
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
        }
    }

    var body: some View {
        HStack {
            Image(
                systemName: (self.todoStore.getTodo(index: index).hasChecked ? "checkmark.circle" : "circle")
            )
            .frame(width: 40 , height: 40, alignment: Alignment.center)
            .onTapGesture {
                withAnimation {
                    self.todoStore.todos[self.index].hasChecked = !self.todoStore.todos[self.index].hasChecked
                    self.todoStore.sort()
                }
            }
            TodoView()
            Spacer()
            Image(
                systemName: self.todoStore.getTodo(index: index).image
            )
        }
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(index: 0)
    }
}
