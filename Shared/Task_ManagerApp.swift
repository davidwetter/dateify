//
//  Task_ManagerApp.swift
//  Shared
//
//  Created by David Wetter on 02/05/22.
//

import SwiftUI

@main
struct Task_ManagerApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
