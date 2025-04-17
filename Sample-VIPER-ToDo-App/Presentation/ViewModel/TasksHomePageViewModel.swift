//
//  TasksHomePageViewModel.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import Foundation

struct TasksHomePageConstatns {
    
}

enum SliderTimerDirection {
    case future
    case past
    case unknown
}

protocol TasksHomePageViewModelInput {
    func selectTheDay(with date: Date)
    func onDateScrolled(to direction: SliderTimerDirection)
    
    func updatetaskList(task: Task)
    func toggleTaskCompletion(task: Task)
    func deleteTask(task: Task)
    
}

protocol TasksHomePageViewModelOutput {
    func getSelectedDate() -> Date
    func getCurrentSelectedDateTasks() -> [Task]
}

protocol TasksHomePageViewModelProtocol: ObservableObject, TasksHomePageViewModelInput, TasksHomePageViewModelOutput {
}

class TasksHomePageViewModel: TasksHomePageViewModelProtocol {
    private let dateUseCase: DateUsecaseProtocol
    private let taskUseCase: TaskUsecaseProtocol
    
    @Published var items: [Task] = []
    @Published var weeks: [WeekModel] = []
    @Published var selectedDate: Date {
        didSet {
            calculatePastAndFutureWeeks(with: selectedDate)
        }
    }
    
    private func calculatePastAndFutureWeeks(with date: Date) {
        weeks = dateUseCase.calculatePastAndFutureWeeks(with: date)
    }
    
    init(dateUseCase: DateUsecaseProtocol, taskUseCase: TaskUsecaseProtocol, with date: Date = Date()) {
        self.dateUseCase = dateUseCase
        self.taskUseCase = taskUseCase
        self.selectedDate = Calendar.current.startOfDay(for: date)
        calculatePastAndFutureWeeks(with: selectedDate)
        self.items = taskUseCase.getTaskList()
    }
}

// MARK: - Input Protocol Implemention
extension TasksHomePageViewModel {
    func selectTheDay(with date: Date) {
        selectedDate = Calendar.current.startOfDay(for: date)
    }
    
    func onDateScrolled(to direction: SliderTimerDirection) {
        switch direction {
        case .future:
            selectedDate = Calendar.current.date(byAdding: .day, value: 7, to: selectedDate)!
            
        case .past:
            selectedDate = Calendar.current.date(byAdding: .day, value: -7, to: selectedDate)!
            
        case .unknown:
            selectedDate = selectedDate
        }
        
        calculatePastAndFutureWeeks(with: selectedDate)
    }
    
    func updatetaskList(task: Task) {
        items = taskUseCase.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) {
        items = taskUseCase.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) {
        items = taskUseCase.delteTask(task: task)
    }
}

// MARK: - Output Protocol Implemention
extension TasksHomePageViewModel {
    func getSelectedDate() -> Date {
        selectedDate
    }
    
    func getCurrentSelectedDateTasks() -> [Task] {
        taskUseCase.getCurrentSelectedDateTasks(of: selectedDate)
    }
}

