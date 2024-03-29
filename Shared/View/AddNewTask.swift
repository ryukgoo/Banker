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
  @Namespace var animation
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
              .background {
                if taskModel.taskColor == color {
                  Circle()
                    .strokeBorder(.gray)
                    .padding(-3)
                }
              }
              .contentShape(Circle())
              .onTapGesture {
                taskModel.taskColor = color
              }
          }
        }
        .padding(.top, 10)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.top, 30)

      Divider()
        .padding(.vertical, 10)

      VStack(alignment: .leading, spacing: 12) {
        Text("Task Deadline")
          .font(.caption)
          .foregroundColor(.gray)

        Text(taskModel.taskDeadline.formatted(date: .abbreviated, time: .omitted) + ", "
             + taskModel.taskDeadline.formatted(date: .omitted, time: .shortened))
          .font(.callout)
          .fontWeight(.semibold)
          .padding(.top, 8)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .overlay(alignment: .bottomTrailing) {
        Button {

        } label: {
          Image(systemName: "calendar")
            .foregroundColor(.black)
        }
      }

      Divider()

      VStack(alignment: .leading, spacing: 12) {
        Text("Task Title")
          .font(.caption)
          .foregroundColor(.gray)

        TextField("", text: $taskModel.taskTitle)
          .frame(maxWidth: .infinity)
      }

      Divider()

      // MARK: Sample Task Types
      let taskTypes: [String] = ["Basic", "Urgent", "Important"]
      VStack(alignment: .leading, spacing: 12) {
        Text("Task Type")
          .font(.caption)
          .foregroundColor(.gray)

        HStack(spacing: 12) {
          ForEach(taskTypes, id: \.self) { type in
            Text(type)
              .font(.callout)
              .padding(.vertical, 8)
              .frame(maxWidth: .infinity)
              .foregroundColor(taskModel.taskType == type ? .white : .black)
              .background {
                if taskModel.taskType == type {
                  Capsule()
                    .fill(.black)
                    .matchedGeometryEffect(id: "TYPE", in: animation)
                } else {
                  Capsule()
                    .strokeBorder(.black)
                }
              }
              .contentShape(Capsule())
              .onTapGesture {
                withAnimation { taskModel.taskType = type }
              }
          }
        }
        .padding(.top, 8)
      }
      .padding(.top, 10)
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
