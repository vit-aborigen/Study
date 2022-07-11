//
//  DateHelper.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 10.07.22.
//

import Foundation

extension Date {
    func distanceFromTodayInDays(dayBefore: Date) -> Int {
        Calendar.current.dateComponents([.day], from: dayBefore, to: Date()).day ?? -1
    }
}

final class DateHelper: ObservableObject {
    let today = Date()
    let bday = Calendar.current.date(from: DateComponents(year: 1985, month: 9, day: 1))! // 2DO: replace with Environment's date
    var daysFromBirthDay: Int { today.distanceFromTodayInDays(dayBefore: bday) }
    
    static func getAxisNamesForDay(for day: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateFormat = "MMM dd"
        formatter.timeZone = .current
        return formatter.string(from: day)
    }
}
