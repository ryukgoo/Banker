//
//  AddNewTask.swift
//  Banker (iOS)
//
//  Created by Young-Wook Kim on 2022/05/19.
//

import SwiftUI

struct AddNewTask: View {
  @EnvironmentObject var taskModel: TaskViewModel
  // MARK: All Envirnment Values in one Variable
  @Environment(\.self) var env
  var body: some View {
    VStack(spacing: 12) {
      Text("Edit Task")
        .font(.title3.bold())
        .frame(maxWidth: .infinity)
        .overlay(alignment: .leading) {
          Button {
            env.dismiss()
          } label: {
            Image(systemName: "arrow.left")
              .font(.title3)
              .foregroundColor(.black)
          }
        }
      
      VStack(alignment: .leading, spacing: 12) {
        Text("Task Color")
          .font(.caption)
          .foregroundColor(.gray)
        
        // MARK: Sample card Colors
        let colors: [String] = [
          "Yellow", "Green", "Blue", "Purple", "Red", "Orange"
        ]
        
        HStack(spacing: 15) {
          ForEach(colors, id: \.self) { color in
            Circle()
              .fill(Color(color))
              .frame(width: 25, height: 25)
          }
        }
      }
    }
    .frame(maxHeight: .infinity, alignment: .top)
    .padding()
  }
}

struct AddNewTask_Previews: PreviewProvider {
  static var previews: some View {
    AddNewTask()
      .environmentObject(TaskViewModel())
  }
}
