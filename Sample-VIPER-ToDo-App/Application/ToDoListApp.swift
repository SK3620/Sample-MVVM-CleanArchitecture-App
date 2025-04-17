//
//  ToDoListApp.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            TasksHomePage(viewModel: makeTasksHomePageViewModel())
        }
    }

    private func makeTasksHomePageViewModel() -> TasksHomePageViewModel {
        let taskDataProvider = TaskDataProvider()
        let taskRepository = TaskRepository(taskDataProvider: taskDataProvider)
        let taskUseCase = TaskUsecase(taskRepository: taskRepository)

        let dateDataProvider = DateDataProvider()
        let dateRepository = DateRepository(dateDataProvider: dateDataProvider)
        let dateUseCase = DateUsecase(dateRepositpry: dateRepository)

        return TasksHomePageViewModel(dateUseCase: dateUseCase, taskUseCase: taskUseCase)
    }
}

#Preview(body: {
    TasksHomePage(viewModel: previewTasksHomePageViewModel())
})

private func previewTasksHomePageViewModel() -> TasksHomePageViewModel {
    let taskDataProvider = TaskDataProvider()
    let taskRepository = TaskRepository(taskDataProvider: taskDataProvider)
    let taskUsecase = TaskUsecase(taskRepository: taskRepository)

    let dateDataProvider = DateDataProvider()
    let dateRepository = DateRepository(dateDataProvider: dateDataProvider)
    let dateUseCase = DateUsecase(dateRepositpry: dateRepository)

    return TasksHomePageViewModel(dateUseCase: dateUseCase, taskUseCase: taskUsecase)
}

