//
//  Home.swift
//  Banker (iOS)
//
//  Created by Young-Wook Kim on 2022/05/17.
//

import SwiftUI

struct Home: View {

  @StateObject var taskModel: TaskViewModel = .init()
  // MARK: Matched Geometry Namespace
  @Namespace var animation
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        VStack(alignment: .leading, spacing: 8) {
          Text("Welcome Back")
            .font(.callout)
          Text("Here's Update Today.")
            .font(.title2.bold())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)

        customSegmentedBar()
          .padding(.top, 5)

        // MARK: Task View

      }
      .padding()
    }
    .overlay(alignment: .bottom) {
      // MARK: Add Button
      Button {

      } label: {
        Label {
          Text("Add Button")
            .font(.callout)
            .fontWeight(.semibold)
        } icon: {
          Image(systemName: "plus.app.fill")
        }
        .foregroundColor(.white)
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(.black, in: Capsule())
      }
      // MARK: Linear Gradient BG
      .padding(.top, 10)
      .frame(maxWidth: .infinity)
      .background {
        LinearGradient(colors: [
          .white.opacity(0.05),
          .white.opacity(0.4),
          .white.opacity(0.7),
          .white
        ], startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()
      }
    }
  }

  // MARK: Custom Segmented Bar
  @ViewBuilder
  func customSegmentedBar() -> some View {
    let tabs = ["Today", "Updating", "Task Done"]
    HStack(spacing: 10) {
      ForEach(tabs, id: \.self) { tab in
        Text(tab)
          .font(.callout)
          .fontWeight(.semibold)
          .scaleEffect(0.9)
          .foregroundColor(taskModel.currentTab == tab ? .white : .black)
          .padding(.vertical, 6)
          .frame(maxWidth: .infinity)
          .contentShape(Capsule())
          .background {
            if taskModel.currentTab == tab {
              Capsule()
                .fill(.black)
                .matchedGeometryEffect(id: "TAB", in: animation)
            }
          }
          .onTapGesture {
            withAnimation { taskModel.currentTab = tab }
          }
      }
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
