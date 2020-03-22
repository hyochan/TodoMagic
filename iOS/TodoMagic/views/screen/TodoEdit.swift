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
    @Binding var todo: TodoModel
    var fetchedTodos:FetchedResults<Todos>?
    var index: Int

    var body: some View {
        List{
            TodoEditView(todo: $todo)
        }
        .navigationBarItems(trailing:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()

                if (self.fetchedTodos != nil) {
                    let updateItem = self.fetchedTodos![self.index]
                    updateItem.title = self.todo.title
                    updateItem.content = self.todo.content
                    updateItem.image = self.todo.image
                    updateItem.selectedDate = self.todo.selectedDate
                    updateItem.updatedAt = Date()

                    do {
                        try self.context.save()
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
            todo: .constant(testTodos[0]),
            index: 0
        )
    }
}
