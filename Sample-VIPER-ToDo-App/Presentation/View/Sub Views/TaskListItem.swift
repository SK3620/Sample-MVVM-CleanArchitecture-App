//
//  TaskListItem.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import SwiftUI

struct TaskListItem: View {
    
    var task: Task
    @State var showAlert = false
    
    var onPress: (Task) -> ()
    var onLongPress: (Task) -> ()
    
    var deleteAlert: Alert {
        Alert(title: Text("Hey!"),
              message: Text("Are you sure you want to delete this task?"),
              primaryButton: .destructive(Text("Delete"), action: deleteTask), secondaryButton: .cancel()
        )
    }
        
    var body: some View {
        HStack {
            Circle()
                .fill(.gray.opacity(0.1))
                .frame(width: 25, height: 25)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
                .overlay {
                    Circle()
                        .fill(task.isCompleted ? .green.opacity(0.4): .blue.opacity(0.4))
                        .frame(width: 20, height: 20)
                        .shadow(radius: 1)
                }
            
            VStack {
                Text(task.title)
                    .font(.system(size: 15, weight: .light))
            }
            .padding()
            .background(task.isCompleted ? .green.opacity(0.4) : .blue.opacity(0.4))
            .clipShape(.rect(cornerRadius: 10))
            
            Spacer()
        }
        .onTapGesture {
            withAnimation {
                toggleTaskCompletion()
            }
        }
        .onLongPressGesture {
            self.showAlert = true
        }
        .alert(isPresented: $showAlert) {
            deleteAlert
        }
    }
    
    func toggleTaskCompletion() {
        onPress(task)
    }
    
    func deleteTask() {
        onLongPress(task)
    }
}
