//
//  DateFormatter.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 01/08/21.
//

import Foundation

class FormatDate {
    public static let format: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YY HH:mm"
        return formatter
    }()
}
