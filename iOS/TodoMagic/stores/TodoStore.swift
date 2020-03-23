//
//  TodoStore.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/23.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import Foundation

class TodoStore: ObservableObject, Identifiable {
    @Published var todos: [TodoModel] = []

    func addTodo(todo: TodoModel) {
        self.todos.append((todo))
    }
    
    func updateTodo(todo: TodoModel, index: Int) {
        self.todos[index] = todo
    }
    
    func countTodos() -> Int {
        return self.todos.count
    }
    
    func getTodo(index: Int) -> TodoModel {
        if (todos.count > index) {
            return self.todos[index]
        }
        return TodoModel(title: "", image: "umbrella")
    }
    
    func removeTodo(offsets: IndexSet) {
        self.todos.remove(at: offsets.first!)
    }

    func sort() {
        self.todos = self.todos.sorted {
            if $0.hasChecked != $1.hasChecked {
                return !$0.hasChecked && $1.hasChecked
            }

            else { // All other fields are tied, break ties by last name
                return $0.selectedDate.compare($1.selectedDate) == .orderedDescending
            }
        }
    }
}
