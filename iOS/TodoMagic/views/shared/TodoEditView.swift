//
//  TodoEditView.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/09.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct TodoEditView: View {
    @Binding var todo: TodoModel;

    var body: some View {
        VStack{
            HStack {
                NavigationLink(destination: SelectIcon(
                    todo: self.$todo
                )) {
                    Image(systemName: self.todo.image ?? systemIcons[0])
                        .frame(width: 50 , height: 50, alignment: Alignment.center)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color("background"), lineWidth: 4))
                        .shadow(radius: 10)
                }
            }
            .frame(width: 50 , height: 50, alignment: Alignment.center)
            .padding(.vertical, 50)

            VStack(alignment: .leading) {
                Text("TITLE")
                    .font(.callout)
                    .bold()
                TextField("ENTER_TITLE", text: $todo.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.horizontal)

            VStack(alignment: .leading) {
                Text("DESCRIPTION")
                    .font(.callout)
                    .bold()
                TextField("ENTER_DESCRIPTION", text: $todo.content)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            .padding(.vertical, 10)

            DatePicker(
                "Please enter date",
                selection: $todo.selectedDate,
                displayedComponents: .date
            ).labelsHidden()

            Spacer()
        }
    }
}

struct TodoEditView_Previews: PreviewProvider {
    static var previews: some View {
        TodoEditView(todo: .constant(testTodos[0]))
    }
}
