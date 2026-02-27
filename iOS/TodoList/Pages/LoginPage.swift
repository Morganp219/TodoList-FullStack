//
//  LoginPage.swift
//  TodoList
//
//  Created by Morgan Pritchard on 2/26/26.
//

import SwiftUI

struct LoginPage: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Spacer()
            Text("My Todo List")
                .bold()
                .font(.largeTitle)
            Text("Created by: Morgan Pritchard")
                .italic()
                .padding(.bottom)
            Spacer()
            VStack(spacing: 40) {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                Button {
                    
                } label: {
                    Text("Login")
                }
            }
            .padding()
            Spacer()
            
        }
    }
}

#Preview {
    LoginPage()
}
