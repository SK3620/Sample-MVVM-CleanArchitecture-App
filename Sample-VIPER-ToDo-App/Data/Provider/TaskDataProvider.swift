//
//  DateDataProvider.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import Foundation

protocol TaskDataProviderProtocol {
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func delteTask(task: Task) -> [Task]
    func getCurrentSelectedDateTasks(of date: Date) -> [Task]
}

class TaskDataProvider {
    
    private var taskList: [Task] = []
    
    init() {
        self.taskList = self.getTaskListFromUserDefaults()
    }
    
    private func getTaskListFromUserDefaults() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: "notes") else { return [] }
        
        if let json = try? JSONDecoder().decode([Task].self, from: data) {
            return json
        }
        
        return []
    }
    
    private func saveUpdatedTaskList() {
        guard let date = try? JSONEncoder().encode(taskList) else { return }
        UserDefaults.standard.set(date, forKey: "notes")
    }
}

extension TaskDataProvider: TaskDataProviderProtocol {
    
    func getTaskList() -> [Task] {
        taskList
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskList.append(task)
        saveUpdatedTaskList()
        return taskList
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        let index = taskList.firstIndex(of: task) ?? 0
        taskList[index].isCompleted.toggle()
        saveUpdatedTaskList()
        return taskList
    }
    
    func delteTask(task: Task) -> [Task] {
        let index = taskList.firstIndex(of: task) ?? 0
        taskList.remove(at: index)
        saveUpdatedTaskList()
        return taskList
    }
    
    func getCurrentSelectedDateTasks(of date: Date) -> [Task] {
        return getTaskList().filter {
            $0.date.toString(format: "EEEE, dd.MM.yyyy") == date.toString(format: "EEEE, dd.MM.yyyy")
        }
        .sorted { !$0.isCompleted && $1.isCompleted }
    }
}
