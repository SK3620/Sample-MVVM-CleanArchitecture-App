//
//  task.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import SwiftUI

struct Task: Codable, Hashable, Identifiable {
    var id: UUID
    var title: String
    var date: Date
    var isCompleted: Bool
    
    init(id: UUID = .init(), title: String, date: Date, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
}
