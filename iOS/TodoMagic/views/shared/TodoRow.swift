//
//  TodoRow.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/05.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct TodoRow: View {
    @Binding var todo: TodoModel
    @Binding var todos: [TodoModel]
    
    func TodoView() -> some View {
        if (todo.hasChecked) {
            return VStack(alignment: .leading) {
                Text(todo.title)
                    .strikethrough()
                    .font(.system(size: 20, weight: .bold))
                Text(getFormattedDate(date: todo.date, format: "dd-MMM-yyyy"))
                    .strikethrough()
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
        }
        return VStack(alignment: .leading) {
            Text(todo.title)
                .font(.system(size: 20, weight: .bold))
            Text(getFormattedDate(date: todo.date, format: "dd-MMM-yyyy"))
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
        }
    }

    var body: some View {
        HStack {
            Image(
                systemName: (self.todo.hasChecked ? "checkmark.circle" : "circle")
            )
            .frame(width: 40 , height: 40, alignment: Alignment.center)
            .onTapGesture {
                withAnimation {
                    self.todo.hasChecked = !self.todo.hasChecked
                    self.todos = self.todos.sorted(by: {!$0.hasChecked && $1.hasChecked})
                }
            }
            TodoView()
            Spacer()
            Image(
                systemName: self.todo.image
            )
        }
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(todo: .constant(todos[0]), todos: .constant(todos))
    }
}
