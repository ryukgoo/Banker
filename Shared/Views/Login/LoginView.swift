//
//  LoginView.swift
//  Banker (iOS)
//
//  Created by Young-Wook Kim on 2023/01/31.
//

import SwiftUI

struct LoginView: View {

    // MARK: - User Detail
    @State var email: String = ""
    @State var password: String = ""
    // MARK: - View Properties
    @State var createAccount: Bool = false
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    @State var isLoading: Bool = false

    var body: some View {
        VStack(spacing: 10) {
            Text("Lets Sign you in")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("Welcome Back, \nYou have been missed")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)

            VStack(spacing: 12) {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .border(1, .gray.opacity(0.5))

                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .border(1, .gray.opacity(0.5))

                Button("Reset password?", action: login)
                    .font(.callout.weight(.medium))
                    .frame(maxWidth: .infinity, alignment: .trailing)

                Button(action: login) {
                    // MARK: - Login Button
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fillView(.black)
                }
                .padding(.top, 10)
            }
            .padding(.top, 25)

            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                    .font(.callout)

                Button("Register Now") {
                    createAccount.toggle()
                }
                .font(.callout.weight(.bold))
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        .overlay {
            LoadingView(show: $isLoading)
        }
    }

    func login() {
        isLoading = true
    }

    func register() {

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
