//
//  Date+Extension.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import Foundation

extension Date {
    func monthToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL"
        return formatter.string(from: self)
    }
    
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar.current
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
}
