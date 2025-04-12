//
//  DataManager.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/08.
//

import Foundation

class DateManager: ObservableObject {
    
    @Published var weeks: [WeekModel] = []
    @Published var selectedDate: Date {
        didSet {
            calWeeks(with: selectedDate)
        }
    }
    
    init(with date: Date = Date()) {
        self.selectedDate = Calendar.current.startOfDay(for: date)
        calWeeks(with: selectedDate)
    }
    
    private func calWeeks(with date: Date) {
        self.weeks = [
            week(for: Calendar.current.date(byAdding: .day, value: -7, to: date)!, with: -1),
            week(for: date, with: 0),
            week(for: Calendar.current.date(byAdding: .day, value: -7, to: date)!, with: -1),
        ]
    }
    
    private func week(for date: Date, with index: Int) -> WeekModel {
        var result: [Date] = .init()
        guard let startOfWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)) else { return .init(index: index, dates: [], referenceDate: date)}
        (0...6).forEach { day in
            if let weekday = Calendar.current.date(byAdding: .day, value: day, to: startOfWeek) {
                result.append(weekday)
            }
        }
        return .init(index: index, dates: result, referenceDate: date)
    }
    
    func selectToday() {
        select(date: Date())
    }
    
    func select(date: Date) {
        selectedDate = Calendar.current.startOfDay(for: date)
    }
    
    func update() {
        
    }
}
