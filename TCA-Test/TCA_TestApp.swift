//
//  TCA_TestApp.swift
//  TCA-Test
//
//  Created by Elliot Knight on 18/12/2022.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_TestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: State(), reducer: reducer, environment: Environment()))
        }
    }
}
