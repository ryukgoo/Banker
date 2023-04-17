//
//  BankerApp.swift
//  Shared
//
//  Created by Young-Wook Kim on 2022/05/17.
//

import SwiftUI

@main
struct BankerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
