//
//  StudySessionViewModel.swift
//  SMU
//
//  Created by Guilherme Schmid on 23.06.24.
//

import Foundation
import Combine

class StudySessionViewModel: ObservableObject {
    @Published var studySessions: [StudySession] = []
    
    func addStudySession(subject: String, date: Date, duration: TimeInterval) {
        let newSession = StudySession(subject: subject, date: date, duration: duration)
        studySessions.append(newSession)
    }
    
    func removeStudySession(id: UUID) {
        studySessions.removeAll { $0.id == id }
    }
}
