//
//  DateHelper.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 10.07.22.
//

import Foundation

extension Date {
    func distanceFromTodayInDays(dayBefore: Date) -> Double {
        Double(Calendar.current.dateComponents([.day], from: dayBefore, to: Date()).day ?? 0)
    }
}

final class DateHelper {
    let today = Date()
    let bday = Calendar.current.date(from: DateComponents(year: 1985, month: 9, day: 1))! // 2DO: replace with Environment's date
    var daysFromBirthDay: Double { today.distanceFromTodayInDays(dayBefore: bday) }
    
    static func getAxisNamesForDay(for day: Double) -> String {
        let secondsFromBirthday = day * 24 * 60 * 60
        let date = Date(timeInterval: TimeInterval(secondsFromBirthday), since: DateHelper().bday) // replace with Environment
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateFormat = "MMM-dd"
        formatter.timeZone = .current
        return formatter.string(from: date)
    }
}
