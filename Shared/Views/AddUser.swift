//
//  AddUser.swift
//  Banker (iOS)
//
//  Created by Young-Wook Kim on 2023/01/13.
//

import SwiftUI

struct AddUser: View {

    @Environment(\.self) var environment
    var body: some View {
        VStack(spacing: 12) {
            Text("Add User")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Button {
                        environment.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

struct AddUser_Previews: PreviewProvider {
    static var previews: some View {
        AddUser()
    }
}
