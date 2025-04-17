//
//  DateUsecase.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import Foundation

protocol DateUsecaseProtocol {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel]
}

class DateUsecase {
    private let dateRepositpry: DateRepositoryProtocol
    
    init(dateRepositpry: DateRepositoryProtocol) {
        self.dateRepositpry = dateRepositpry
    }
}

extension DateUsecase: DateUsecaseProtocol {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel] {
        return dateRepositpry.calculatePastAndFutureWeeks(with: date)
    }
}
