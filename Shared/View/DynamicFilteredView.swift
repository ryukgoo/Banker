//
//  DynamicFilteredView.swift
//  Banker (iOS)
//
//  Created by ywkimMac on 2022/05/20.
//

import SwiftUI
import CoreData

struct DynamicFilteredView<Content: View, T>: View where T: NSManagedObject {

  // MARK: Core Data Request
  @FetchRequest var request: FetchedResults<T>
  let content: (T) -> Content

  init(currentTab: String, @ViewBuilder content: @escaping (T) -> Content) {

    // MARK: Predicate to Filter current date Tasks
    let calendar = Calendar.current
    var predicate: NSPredicate!
    let today = calendar.startOfDay(for: Date())
    let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
    let future = Date.distantFuture
    let past = Date.distantPast
    // Filter Key
    let filterKey = "deadline"

    if currentTab == "Today" {
      predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@ AND completed == %i",
                              argumentArray: [today, tomorrow, 0])

    } else if currentTab == "Updating" {
      predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@ AND completed == %i",
                              argumentArray: [tomorrow, future, 0])
    } else if currentTab == "Failed" {
      predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@ AND completed == %i",
                              argumentArray: [past, today, 0])
    } else {
      predicate = NSPredicate(format: "completed == %i", argumentArray: [1])
    }

    // Initializing Request with NSPredicate
    _request = FetchRequest(entity: T.entity(),
                            sortDescriptors: [.init(keyPath: \Task.deadline, ascending: false)],
                            predicate: predicate)
    self.content = content
  }

  var body: some View {
    Group {
      if request.isEmpty {
        Text("No Tasks found!!!")
          .font(.system(size: 16))
          .fontWeight(.light)
          .offset(y: 100)
      } else {
        ForEach(request, id: \.objectID) { object in
          self.content(object)
        }
      }
    }
  }
}
