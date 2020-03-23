//
//  SelectIcon.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/23.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct SelectIcon: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var todo: TodoModel;

    var body: some View {
        VStack {
            List {
                ForEach(0..<systemIcons.count, id: \.self) { i in
                    Button(action: {
                        self.todo.image = systemIcons[i]
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: systemIcons[i])
                                .renderingMode(.original)
                                .frame(width: 32 , height: 32, alignment: Alignment.center)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                            Text(systemIcons[i])
                                .padding(.leading, 16)
                            Spacer()
                        }
                        .padding(.horizontal, 12)
                        .frame(height: 50, alignment: Alignment.leading)
                    }
                }
            }
        }.navigationBarTitle("SELECT_ICON")
    }
}

struct SelectIcon_Previews: PreviewProvider {
    static var previews: some View {
        SelectIcon(todo: .constant(testTodos[0]))
    }
}
