////
////  HabitEntry.swift
////  FU-HabitRabbit
////
////  Created by Philip Miranda on 2023-04-23.
////
//
//import Foundation
//import FirebaseFirestoreSwift
//
//struct HabitEntry : Identifiable, Equatable {
//    var id = UUID()
//    var content : String
//
//    
//    private var unformatedDate = Date()
//    private let dateFormatter = DateFormatter()
//    
//    init(content: String) {
//        self.content = content
//        dateFormatter.dateStyle = .medium
//    }
//    
//    var date : String {
//        
//        return dateFormatter.string(from: unformatedDate)
//    }
//}
