//
//  LoadingPage.swift
//  TodoList
//
//  Created by Morgan Pritchard on 2/26/26.
//

import SwiftUI

struct LoadingPage: View {
    var body: some View {
        VStack {
            Text("My Todo List")
                .bold()
                .font(.largeTitle)
            Text("Created by: Morgan Pritchard")
                .italic()
                .padding(.bottom)
            ProgressView()
        }
    }
}

#Preview {
    LoadingPage()
}
