//
//  PerxTechnicalChallengeApp.swift
//  PerxTechnicalChallenge
//
//  Created by Tyson Langton-Weatherley on 25/1/2023.
//

import SwiftUI

@main
struct PerxTechnicalChallengeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
