//
//  EditableTextField.swift
//  TodoList
//
//  Created by Morgan Pritchard on 2/26/26.
//

import SwiftUI

struct EditableTextField: View {
    @Binding var text: String
    @State var isEditing: Bool
    
    var body: some View {
        HStack {
            if(isEditing) {
    //            Show the Textfield
                TextField("", text: $text)
                Spacer()
                Image(systemName: "checkmark")
                    .bold()
                    .font(.title2)
                    .onTapGesture {
                        isEditing = false
                    }
            } else {
    //            Show just plain text.
                Text(text)
                    .bold()
                    .font(.title)
                Spacer()
                Image(systemName: "pencil.circle")
                    .bold()
                    .font(.title)
                    .onTapGesture {
                        isEditing = true
                    }
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var text: String = "Lorem ipsum dolar amit"
    VStack {
        EditableTextField(text: $text, isEditing: false)
            .padding(.bottom, 40)
        EditableTextField(text: $text, isEditing: true)
    }
}
