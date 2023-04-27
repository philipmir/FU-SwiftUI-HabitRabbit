//
//  Item.swift
//  FU-HabitRabbit
//
//  Created by Philip Miranda on 2023-04-25.
//


import Foundation
import FirebaseFirestoreSwift



//struct Item : Codable, Identifiable {
//    @DocumentID var id : String?
//    var name : String
//    var category : String = ""
//    var done : Bool = false
//    var date: String? // add a 'date' field
//    var streak = 1
//    var habit = 1
//
//}


struct Item: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var done: Bool
    var lastDoneDate: Date?
    var streak: Int = 0
    
    mutating func toggle() {
        done = !done
        if done {
            if let lastDoneDate = lastDoneDate {
                let calendar = Calendar.current
                if calendar.isDateInYesterday(lastDoneDate) {
                    streak += 1
                } else if !calendar.isDateInToday(lastDoneDate) {
                    streak = 1
                }
            } else {
                streak = 1
            }
            lastDoneDate = Date()
        }
    }
}
