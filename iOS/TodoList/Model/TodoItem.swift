//
//  TodoItem.swift
//  TodoList
//
//  Created by Morgan Pritchard on 2/26/26.
//
import Foundation

enum ItemStatus: String, CaseIterable {
    case notStarted = "Not Started"
    case inProgress = "In Progress"
    case completed = "Completed"
    case archived = "Archived"
}

struct TodoItem : Identifiable {
    let id = UUID().uuidString
    let title: String
    let desc: String?
    let itemStatus: ItemStatus
    let creationDate: Date = Date()
    let lastUpdated: Date = Date()
}

let mockData: [TodoItem] = [
    
    // MARK: - Not Started
    TodoItem(
        title: "Buy groceries",
        desc: "Milk, Eggs, Bread, Spinach",
        itemStatus: .notStarted
    ),
    
    TodoItem(
        title: "Schedule dentist appointment",
        desc: nil,
        itemStatus: .notStarted
    ),
    
    
    // MARK: - In Progress
    TodoItem(
        title: "Build SwiftUI login screen",
        desc: "Implement validation and error handling",
        itemStatus: .inProgress
    ),
    
    TodoItem(
        title: "Read 20 pages of Clean Code",
        desc: "Focus on functions chapter",
        itemStatus: .inProgress
    ),
    
    
    // MARK: - Completed
    TodoItem(
        title: "Morning workout",
        desc: "30 min strength training",
        itemStatus: .completed
    ),
    
    TodoItem(
        title: "Submit project report",
        desc: nil,
        itemStatus: .completed
    ),
    
    
    // MARK: - Archived
    TodoItem(
        title: "2024 Tax Filing",
        desc: "All documents submitted and approved",
        itemStatus: .archived
    ),
    
    TodoItem(
        title: "Old portfolio redesign",
        desc: "Replaced with new 2025 version",
        itemStatus: .archived
    )
]
