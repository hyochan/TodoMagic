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
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var todoStore: TodoStore
    @State private var show = false;
    var fetchedTodos:FetchedResults<Todos>?

    @ViewBuilder
    var body: some View {
        NavigationView {
            ZStack {
                if (self.todoStore.countTodos() == 0) {
                    VStack {
                        Text("NO_TODOS")
                        NavigationLink(destination: TodoAdd()) {
                            HStack {
                                Image(systemName: "pencil")
                                .imageScale(.large)
                                .padding(.trailing, 8)

                                Text("ADD_TODO")
                            }
                            .font(.system(size: 16))
                            .multilineTextAlignment(.center)
                            .padding()
                            .padding(.horizontal, 12)
                            .background(Color("background"))
                            .foregroundColor(Color("font"))
                            .border(Color("primary"), width: 1)
                            .animation(.interactiveSpring())
                            .animation(.linear)
                        }.padding(.bottom, 100)
                    }
                } else {
                    List {
                        ForEach(Array(todoStore.todos.enumerated()), id: \.1.id) { (index, todo) in
                            NavigationLink(destination: TodoDetail(
                                fetchedTodos: self.fetchedTodos,
                                index: index
                            )) {
                                TodoRow(index: index)
                                .animation(.linear)
                            }
                        }.onDelete { indexSet in
                            if (self.fetchedTodos != nil) {
                                let deleteItem = self.fetchedTodos![indexSet.first!]
                                self.context.delete(deleteItem)
                                do {
                                    try self.context.save()
                                    self.todoStore.removeTodo(offsets: indexSet)
                                } catch {
                                    print(error)
                                }
                            }
                        }
                    }
                    .navigationBarTitle("TODO")
                    .navigationBarItems(trailing:
                        NavigationLink(
                            destination: TodoAdd()
                        ) {
                            Image(systemName: "plus")
                            .imageScale(.large)
                        }
                    )
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct Todo_Previews: PreviewProvider {
    static var previews: some View {
        Todo()
    }
}

