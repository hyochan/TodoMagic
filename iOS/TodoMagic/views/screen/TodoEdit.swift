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
    @Binding var todo: TodoModel

    var body: some View {
        List{
            TodoEditView(todo: $todo)
        }
        .navigationBarItems(trailing:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
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
        TodoEdit(todo: .constant(todos[0]))
    }
}
