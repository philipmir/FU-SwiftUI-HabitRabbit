//
//  FU_HabitRabbitApp.swift
//  FU-HabitRabbit
//
//  Created by Philip Miranda on 2023-04-23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct FU_HabitRabbitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
//    @StateObject var habit = HabitViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView() //.environmentObject(habit)
        }
    }
}
