//
//  TaskViewModel.swift
//  Banker (iOS)
//
//  Created by Young-Wook Kim on 2022/05/19.
//

import CoreData
import SwiftUI

class TaskViewModel: ObservableObject {
  @Published var currentTab: String = "Today"
  
  // MARK: New Task Properties
  @Published var openEditTask: Bool = false
  @Published var taskTitle: String = ""
  @Published var taskColor: String = "Yellow"
  @Published var taskDeadline: Date = Date()
  @Published var taskType: String = "Basic"
}
