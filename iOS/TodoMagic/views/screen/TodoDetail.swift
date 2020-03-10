//
//  TodoDetail.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/03.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct TodoDetail: View {
    // Note that you are able to bind to @State directly trough props
    @Binding var todo: TodoModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Image(systemName: todo.image)
                    .frame(width: 80 , height: 80, alignment: Alignment.center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.vertical, 20)

                Text(todo.text)
                    .font(.system(size: 24, weight: .medium))
                    .padding(.bottom, 8)

                Text(getFormattedDate(date: todo.date, format: "dd-MMM-yyyy"))
                    .font(.system(size: 18, weight: .light))
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            Spacer()
        }
        .padding(28)
        .navigationBarTitle(todo.title)
        .navigationBarItems(trailing:
            NavigationLink(
                destination: TodoEdit(todo: self.$todo)
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
        TodoDetail(
            todo: .constant(todos[0])
        )
    }
}
