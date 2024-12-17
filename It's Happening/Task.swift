//
//  Task.swift
//  It's Happening
//
//  Created by Kelly Karen Ribeiro on 16/12/24.
//

import Foundation
import SwiftData
enum taskType: Codable {
    case nowTasks
    case laterTasks
}

@Model
class ToDoTask {
    var id = UUID()
    var title: String
    var dateAdded: Date
    var isCompleted: Bool
    var taskType: taskType
    
    init(title: String = "", taskType: taskType = .nowTasks) {
        self.title = title
        self.dateAdded = .now
        self.isCompleted = false
        self.taskType = taskType
    }
    
}
