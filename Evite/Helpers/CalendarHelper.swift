//
//  CalendarHelper.swift
//  Evite
//
//  Created by Will morris on 9/16/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

extension Date {
    func thisWeek() -> [IdentifiableDate] {
        var week: [IdentifiableDate] = []
        var newDate = self
        for _ in 1...3 {
            week.append(IdentifiableDate(date: newDate))
            newDate = newDate.addingTimeInterval(86400)
        }
        return week
    }
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

class IdentifiableDate: Identifiable {
    let id: UUID = UUID()
    let date: Date
    let day: Int
    let month: Int
    
    init(date: Date) {
        self.date = date
        self.day = date.get(.day)
        self.month = date.get(.month)
    }
}
