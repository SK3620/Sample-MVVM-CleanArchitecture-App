//
//  NewTaskView.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import SwiftUI

struct NewTaskView: View {
    
    var saveTask: (Task) -> ()
    
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Add New Task")
                .fontDesign(.rounded)
                .font(.title2)
                .padding(30)
                .frame(maxWidth: .infinity)
                .background {
                    Rectangle()
                        .fill(.gray.opacity(0.2))
                        .clipShape(.rect(bottomLeadingRadius: 30, bottomTrailingRadius: 30))
                }
            
            VStack(spacing: 20) {
                TextField("Your task title", text: $taskTitle)
                    .padding(.top)
                
                HStack(alignment: .center, spacing: 20) {
                    Text("Timeline")
                        .font(.title)
                    DatePicker("", selection: $taskDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
            }
            .padding(30)
            
            Button {
                saveTask(Task(title: taskTitle, date: taskDate))
                dismiss()
            } label: {
                Text("Create Task")
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .foregroundColor(.white)
                    .background(.black)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal, 30)
            }

        }
    }
}
