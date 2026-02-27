//
//  HomePage.swift
//  TodoList
//
//  Created by Morgan Pritchard on 2/26/26.
//

import SwiftUI

struct HomePage: View {
    @State var itemEditing: TodoItem?
    @Binding var isLoggedIn: Bool
    var body: some View {
        VStack {
            HStack {
                Menu {
                    Button(role: .destructive) {
                        isLoggedIn = false
                    } label: {
                        Label("Logout", systemImage: "rectangle.portrait.and.arrow.right")
                    }
                } label: {
                    Image(systemName: "person.circle")
                        .bold()
                        .font(.title)
                }
                
                Spacer()
                Image(systemName: "plus.circle")
                    .font(.title)
                    .bold()
                    .onTapGesture {
                        itemEditing = TodoItem(title: "", desc: "", itemStatus: .notStarted)
                    }
            }
            .padding()
            
            List(mockData) { item in
                HStack {
                    Circle()
                        .frame(width: 40, height: 40)
                    Text(item.title)
                        .bold()
                        .font(.title3)
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                .onTapGesture {
                    itemEditing = item
                }
            }
            
            
            Spacer()
        } .overlay {
            if itemEditing != nil {
                ItemEditorOverlay(item: Binding(get: {
                    return itemEditing!
                }, set: { item in
                    itemEditing = item
                }))
            }
        }
    }
}

#Preview {
    HomePage(isLoggedIn: .constant(true))
}
