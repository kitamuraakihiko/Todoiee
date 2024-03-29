//
//  TodoieeApp.swift
//  Todoiee
//
//  Created by Kitamura Akihiko on 2024/01/27.
//

import SwiftUI

@main
struct TodoieeApp: App {
    var todoList = TodoList.sample
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(todoList)
    }
}
