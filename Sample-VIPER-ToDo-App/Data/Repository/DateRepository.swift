//
//  DateRepository.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import Foundation

protocol DateRepositoryProtocol {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel]
}

class DateRepository {
    private let dateDataProvider: DateDataProviderProtocol
    
    init(dateDataProvider: DateDataProviderProtocol) {
        self.dateDataProvider = dateDataProvider
    }
}

extension DateRepository: DateRepositoryProtocol {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel] {
        dateDataProvider.calculatePastAndFutureWeeks(with: date)
    }
}
