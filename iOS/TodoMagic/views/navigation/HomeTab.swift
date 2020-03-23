//
//  Todo.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/03.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct HomeTab: View {
    @FetchRequest(fetchRequest: Todos.getAllTodos()) var fetchedTodos:FetchedResults<Todos>
    @EnvironmentObject var todoStore: TodoStore

    var body: some View {
        TabView{
            Todo(fetchedTodos: self.fetchedTodos)
            .tabItem{
                 Image(systemName: "square.stack.3d.down.right")
                 Text("TODO")
            }

            Settings()
            .tabItem {
                Image(systemName: "gear")
                Text("SETTINGS")
            }
        }.onAppear() {
            self.fetchedTodos.forEach { todos in
                self.todos.append(
                    TodoModel(
                        title: todos.title ?? "",
                        image: todos.image ?? "",
                        content: todos.content ?? "",
                        selectedDate: todos.selectedDate ?? Date(),
                        createdAt: todos.createdAt,
                        updatedAt: todos.updatedAt
                    )
                )
            }
            self.todos = self.todos.sorted {
                if $0.hasChecked != $1.hasChecked {
                    return !$0.hasChecked && $1.hasChecked
                }

                else { // All other fields are tied, break ties by last name
                    return $0.selectedDate.compare($1.selectedDate) == .orderedDescending
                }
            }
        }
        .accentColor(Color("primary"))
        .onAppear {
            self.fetchedTodos.forEach { todos in
                self.todoStore.addTodo(
                    todo: TodoModel(
                        title: todos.title ?? "",
                        image: todos.image ?? "",
                        content: todos.content ?? "",
                        selectedDate: todos.selectedDate ?? Date(),
                        createdAt: todos.createdAt,
                        updatedAt: todos.updatedAt
                    )
                )
                self.todoStore.sort()
            }
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}

