//
//  ItemEditorOverlay.swift
//  TodoList
//
//  Created by Morgan Pritchard on 2/26/26.
//

import SwiftUI

struct ItemEditorOverlay: View {
    @Binding var item: TodoItem?
    @State var title: String = "Lorem Ipsum Dolar Amit"
    @State var desc: String = ""
    @State var selectedStatus: ItemStatus = .notStarted
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(
                        width: geo.size.width * 0.8,
                        height: geo.size.height * 0.6
                    )
                    .shadow(radius: 10)
                    .overlay {
                        EditorContent()
                    }
            }
            .onAppear() {
                title = item?.title ?? ""
                desc = item?.desc ?? ""
                selectedStatus = item?.itemStatus ?? ItemStatus.notStarted
            }
        }
    }
    
    func EditorContent() -> some View {
        return VStack {
            EditableTextField(text: $title, isEditing: false)
            TextEditor(text: $desc)
            Picker("Status", selection: $selectedStatus) {
                ForEach(ItemStatus.allCases, id: \.self) { status in
                    Text(status.rawValue)
                        .tag(status)
                }
            }
            Spacer()
            
            Button {
                item = nil
            } label: {
                Text("Finish")
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    HomePage(isLoggedIn: .constant(true))
}
