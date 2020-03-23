//
//  TodoEdit.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/05.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct TodoEdit: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var todoStore: TodoStore
    @State var todo: TodoModel = TodoModel(
        title: "", image: systemIcons[0], content: ""
    )

    var fetchedTodos:FetchedResults<Todos>?
    var index: Int

    var body: some View {
        List{
            TodoEditView(todo: $todo)
        }
        .onAppear {
            let currentTodo = self.todoStore.todos[self.index]
            self.todo = currentTodo
        }
        .navigationBarItems(trailing:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()

                if (self.fetchedTodos != nil) {
                    let updateItem = self.fetchedTodos![self.index]
                    let todo = self.todo;

                    updateItem.title = todo.title
                    updateItem.content = todo.content
                    updateItem.image = todo.image
                    updateItem.selectedDate = todo.selectedDate
                    updateItem.updatedAt = Date()

                    do {
                        try self.context.save()
                        self.todoStore.updateTodo(todo: self.todo, index: self.index)
                    } catch {
                        print(error)
                    }
                }
            }) {
                Text("DONE")
            }
        )
        .navigationBarTitle("EDIT")
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TodoEdit_Previews: PreviewProvider {
    static var previews: some View {
        TodoEdit(
            index: 0
        )
    }
}
