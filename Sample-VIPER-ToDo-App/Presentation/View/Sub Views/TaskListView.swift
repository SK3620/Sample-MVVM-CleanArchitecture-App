//
//  TaskListView.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var viewModel: TasksHomePageViewModel
    var currentDateTasks: [Task] = []
    
    init (viewModel: TasksHomePageViewModel) {
        self.viewModel = viewModel
        currentDateTasks = viewModel.getCurrentSelectedDateTasks()
    }
    
    var body: some View {
        VStack {
            ForEach(currentDateTasks) { task in
                TaskListItem(task: task, onPress: { pressedTask in
                    toggleTaskCompletion(task: pressedTask)
                }, onLongPress: { longPressedTask in
                    deleteTask(task: longPressedTask)
                })
                .background(alignment: .leading) {
                    if currentDateTasks.last?.id != task.id {
                        Rectangle()
                            .frame(width: 1)
                            .offset(x: 12, y: 20)
                    }
                }
            }
        }
        .padding(.top, 15)
    }
    
    func toggleTaskCompletion(task: Task) {
        viewModel.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) {
        viewModel.deleteTask(task: task)
    }
}
