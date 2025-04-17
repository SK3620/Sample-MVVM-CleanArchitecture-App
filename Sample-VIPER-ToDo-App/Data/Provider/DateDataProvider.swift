//
//  DateDataProvider.swift
//  Sample-VIPER-ToDo-App
//
//  Created by 鈴木 健太 on 2025/04/12.
//

import Foundation

protocol DateDataProviderProtocol {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel]
}

class DateDataProvider {
    // 指定された日付を基準に週のインデックスと日付の配列を生成するメソッド
    private func week(for date: Date, with index: Int) -> WeekModel {
        var result: [Date] = .init()
        // 指定日付の週の開始日（週の初め）を取得
        guard let startOfWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)) else {
            return .init(index: index, dates: [], referenceDate: date)
        }
        // 週の7日分の日付を生成
        (0...6).forEach { day in
            if let weekday = Calendar.current.date(byAdding: .day, value: day, to: startOfWeek) {
                result.append(weekday)
            }
        }
        return .init(index: index, dates: result, referenceDate: date)
    }
}

extension DateDataProvider: DateDataProviderProtocol {
    // 対象の日付を中心に、過去・現在・未来の3週間分のデータを生成して返す
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel] {
        return [
            week(for: Calendar.current.date(byAdding: .day, value: -7, to: date)!, with: -1), // 過去1週間
            week(for: date, with: 0), // 現在の1週間
            week(for: Calendar.current.date(byAdding: .day, value: 7, to: date)!, with: 1), // 未来1週間
        ]
    }
}
