//
//  DateFormatter+.swift
//  Evite
//
//  Created by Brian Hersh on 8/25/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

extension DateFormatter {
    convenience init(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) {
        self.init()
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
    }
}
