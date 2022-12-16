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
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                ActivityIndicator()
                    .sheet(isPresented: $isOnboarding) {
                        OnboardingView()
                    }
            }
            else {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
