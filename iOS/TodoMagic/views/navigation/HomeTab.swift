//
//  Todo.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/03.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct HomeTab: View {
    var body: some View {
        TabView{
            Todo()
            .tabItem{
                 Image(systemName: "square.stack.3d.down.right")
                 Text("TODO")
            }

            Settings()
            .tabItem {
                Image(systemName: "gear")
                Text("SETTINGS")
            }
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}

