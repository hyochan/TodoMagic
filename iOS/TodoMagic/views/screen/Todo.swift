//
//  Todo.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/03.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

let testTodos = [
    TodoModel(title: "Wake up", image: "umbrella", content: "This is sample todo!"),
]

struct Todo: View {
    @State private var localTodos: [TodoModel] = []
    @State private var show = false;
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: Todos.getAllTodos()) var fetchedTodos:FetchedResults<Todos>

    var body: some View {
        NavigationView{
            List {
                ForEach(Array(localTodos.enumerated()), id: \.1.id) { (index, todo) in
                    NavigationLink(destination: TodoDetail(
                        todo: self.$localTodos[index],
                        fetchedTodos: self.fetchedTodos,
                        index: index
                    )) {
                        TodoRow(
                            todo: self.$localTodos[index],
                            todos: self.$localTodos
                        )
                        .animation(.linear)
                    }
                }.onDelete { indexSet in
                    let deleteItem = self.fetchedTodos[indexSet.first!]
                    self.context.delete(deleteItem)
                    do {
                        try self.context.save()
                        self.localTodos.remove(at: indexSet.first!)
                    } catch {
                        print(error)
                    }
                }
            }
            .navigationBarTitle("TODO")
            .navigationBarItems(trailing:
                NavigationLink(
                    destination: TodoAdd(todos: $localTodos)
                ) {
                    Image(systemName: "plus")
                    .imageScale(.large)
                }
            )
        }
        .onAppear() {
            self.fetchedTodos.forEach { todos in
                self.localTodos.append(
                    TodoModel(
                        title: todos.title ?? "",
                        image: todos.image ?? "",
                        content: todos.content ?? "",
                        createdAt: todos.createdAt ?? Date()
                    )
                )
            }
            self.localTodos = self.localTodos.sorted(by: {!$0.hasChecked && $1.hasChecked})
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Todo_Previews: PreviewProvider {
    static var previews: some View {
        Todo()
    }
}

