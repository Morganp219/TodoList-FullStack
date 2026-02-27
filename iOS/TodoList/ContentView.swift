//
//  ContentView.swift
//  TodoList
//
//  Created by Teaching on 2/25/26.
//

import SwiftUI

enum Pages {
    case LOADING, LOGIN, HOME
}

struct ContentView: View {
    @State var pageSelected: Pages = .LOADING
    @State var isLoggedIn: Bool = false
    var body: some View {
        VStack {
            switch(pageSelected) {
                case .LOADING:
                    LoadingPage()
                case .LOGIN:
                    LoginPage(isLoggedIn: $isLoggedIn)
                case .HOME:
                    HomePage(isLoggedIn: $isLoggedIn)
            }
        }
        .padding()
        .onChange(of: isLoggedIn) { _, newValue in
            if(newValue) {
                pageSelected = .HOME
            } else {
                pageSelected = .LOGIN
            }
        }
        .task {
            try? await Task.sleep(nanoseconds: 5_000_000_000)
            pageSelected = .LOGIN
        }
    }
}

#Preview {
    ContentView()
}
