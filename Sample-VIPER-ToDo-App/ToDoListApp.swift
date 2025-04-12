//
//  ToDoListApp.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var dateManager: DateManager = DateManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dateManager)
        }
    }
}

#Preview(body: {
    ContentView()
        .environmentObject(DateManager())
})
