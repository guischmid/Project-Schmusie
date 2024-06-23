//
//  StudySession.swift
//  SMU
//
//  Created by Guilherme Schmid on 23.06.24.
//

import Foundation

struct StudySession: Identifiable {
    var id = UUID()
    var subject: String
    var date: Date
    var duration: TimeInterval // duration in seconds
}
