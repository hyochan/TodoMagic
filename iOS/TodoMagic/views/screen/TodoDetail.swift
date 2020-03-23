//
//  TodoDetail.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/03.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct TodoDetail: View {
    @EnvironmentObject var todoStore: TodoStore
    var fetchedTodos:FetchedResults<Todos>?
    var index: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                    .frame(width: 80 , height: 80, alignment: Alignment.center)
                    .shadow(radius: 10)
                    .padding(.vertical, 20)

                Text(todoStore.getTodo(index: index).content)
                    .font(.system(size: 24, weight: .medium))
                    .padding(.bottom, 8)

                Text(getFormattedDate(date: todoStore.getTodo(index: index).selectedDate, format: "dd-MMM-yyyy"))
                    .font(.system(size: 18, weight: .light))
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            Spacer()
        }
        .padding(28)
        .navigationBarTitle(todoStore.getTodo(index: index).title)
        .navigationBarItems(trailing:
            NavigationLink(
                destination: TodoEdit(
                    fetchedTodos: self.fetchedTodos,
                    index: index
                )
            ) {
                Image(systemName: "pencil")
                    .imageScale(.large)
            }
        )
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TodoDetail_Previews: PreviewProvider {
    static var previews: some View {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        return TodoDetail(
            index: 0
        ).environment(\.managedObjectContext, context)
    }
}
