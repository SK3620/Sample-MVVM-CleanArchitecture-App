//
//  DateUsecase.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import Foundation

protocol TaskUsecaseProtocol {
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func delteTask(task: Task) -> [Task]
    func getCurrentSelectedDateTasks(of date: Date) -> [Task]
}

class TaskUsecase {
    private let taskRepository: TaskRepositoryProtocol
    
    init(taskRepository: TaskRepositoryProtocol) {
        self.taskRepository = taskRepository
    }
}

extension TaskUsecase : TaskUsecaseProtocol {
    func getTaskList() -> [Task] {
        taskRepository.getTaskList()
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskRepository.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        taskRepository.toggleTaskCompletion(task: task)
    }
    
    func delteTask(task: Task) -> [Task] {
        taskRepository.delteTask(task: task)
    }
    
    func getCurrentSelectedDateTasks(of date: Date) -> [Task] {
        taskRepository.getCurrentSelectedDateTasks(of: date)
    }
}
