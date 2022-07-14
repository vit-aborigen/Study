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

final class DateHelper: ObservableObject {
    let today = Date()
    let bday = Calendar.current.date(from: DateComponents(year: 2017, month: 9, day: 17))! // 2DO: replace with Environment's date
    var daysFromBirthDay: Double { today.distanceFromTodayInDays(dayBefore: bday) }
    
    static func populateLegend(basedOn biorhythm: Biorhythm) -> [String] {
        var labels = Array<String> ()
        for day in Int(biorhythm.firstDay)...Int(biorhythm.firstDay) + biorhythm.distance {
            labels.append(String(day))
        }
        return labels
    }
    
    static func getAxisNamesForDay(for day: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateFormat = "MMM dd"
        formatter.timeZone = .current
        return formatter.string(from: day)
    }
}
