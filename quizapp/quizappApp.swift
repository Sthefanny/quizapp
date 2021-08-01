//
//  quizappApp.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 30/07/21.
//

import SwiftUI

@main
struct quizappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
