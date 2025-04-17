//
//  ContentView.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/05.
//

import SwiftUI

struct TasksHomePage: View {
    
    @State private var createNewTask: Bool = false
    
    @ObservedObject var viewModel: TasksHomePageViewModel
    
    var body: some View {
        ZStack {
            VStack {
                DataHeaderView(viewModel: viewModel)
                ScrollView(.vertical) {
                    VStack {
                        TaskListView(viewModel: viewModel)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding()
            .overlay(alignment: .bottomTrailing) {
                Button {
                    createNewTask.toggle()
                } label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .padding(26)
                        .background(.black)
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                }
            }
        }
        .sheet(isPresented: $createNewTask) {
            NewTaskView(saveTask: { task in
                viewModel.updatetaskList(task: task)
            }).presentationDetents([.fraction(0.4)])
        }
    }
}
