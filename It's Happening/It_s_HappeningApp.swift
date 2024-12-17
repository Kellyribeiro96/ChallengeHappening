//
//  It_s_HappeningApp.swift
//  It's Happening
//
//  Created by Kelly Karen Ribeiro on 09/12/24.
//

import SwiftUI
import SwiftData

@main
struct It_s_HappeningApp: App {
    var body: some Scene {
        
        WindowGroup {
            TabView {
                Tab("List", systemImage: "checklist.checked"){
                    ContentView()
                }
                
                Tab("Settings", systemImage: "gear"){
                    ContentView()
                }
            }
            
        }.modelContainer(for: ToDoTask.self)
        
        
 
    }
}
// "Settings", systemImage: "gear"){
//ContentView()
