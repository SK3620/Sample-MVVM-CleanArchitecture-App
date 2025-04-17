//
//  DateRepository.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import Foundation

protocol TaskRepositoryProtocol {
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func delteTask(task: Task) -> [Task]
    func getCurrentSelectedDateTasks(of date: Date) -> [Task]
}

class TaskRepository {
    private let taskDataProvider: TaskDataProviderProtocol
    
    init(taskDataProvider: TaskDataProviderProtocol) {
        self.taskDataProvider = taskDataProvider
    }
}

extension TaskRepository : TaskRepositoryProtocol {
    func getTaskList() -> [Task] {
        taskDataProvider.getTaskList()
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskDataProvider.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        taskDataProvider.toggleTaskCompletion(task: task)
    }
    
    func delteTask(task: Task) -> [Task] {
        taskDataProvider.delteTask(task: task)
    }
    
    func getCurrentSelectedDateTasks(of date: Date) -> [Task] {
        taskDataProvider.getCurrentSelectedDateTasks(of: date)
    }
}
