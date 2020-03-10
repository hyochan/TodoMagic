//
//  Todo.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/03.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

let todos = [
    TodoModel(title: "Card", image: "umbrella", text: "I need to make it till 7pm"),
    TodoModel(title: "Do it!", image: "wind", text: "빨리빨리"),
    TodoModel(title: "미팅 고고!", image: "wind", text: "오후 3시 삼성 스파크플러스")
]

struct Todo: View {
    @State private var localTodos: [TodoModel] = todos
    @State private var show = false;

    var body: some View {
        NavigationView{
            List {
                ForEach(Array(localTodos.enumerated()), id: \.1.id) { (index, todo) in
                    NavigationLink(destination: TodoDetail(
                        todo: self.$localTodos[index]
                    )) {
                        TodoRow(
                            todo: self.$localTodos[index],
                            todos: self.$localTodos
                        )
                        .animation(.linear)
                    }
                }.onDelete(perform: delete)
            }
            // Localization in SwiftUI: https://sweetdev.tistory.com/429
            .navigationBarTitle("APP_TITLE")
            // Issue on crashing when navigating back
            // ios 13.2 and upgraded to xcode that has 13.3 simulator
            // https://forums.developer.apple.com/thread/124757
            .navigationBarItems(trailing:
                // Issue on navigating once
                // Happen to be resolved from xcode 11.4 beta
                // https://stackoverflow.com/questions/59279176/navigationlink-works-only-for-once?rq=1
                NavigationLink(
                    destination: TodoAdd(todos: $localTodos)
                ) {
                    Image(systemName: "plus")
                    .imageScale(.large)
                }
            )
        }
        .onAppear() {
            self.localTodos = self.localTodos.sorted(by: {!$0.hasChecked && $1.hasChecked})
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func delete(with indexSet: IndexSet) {
        indexSet.forEach { localTodos.remove(at: $0) }
    }
}

struct Todo_Previews: PreviewProvider {
    static var previews: some View {
        Todo()
    }
}

