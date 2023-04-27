////
////  HabitViewModel.swift
////  FU-HabitRabbit
////
////  Created by Philip Miranda on 2023-04-23.
////
//
//import Foundation
//
//
//class HabitViewModel : ObservableObject {
//    @Published var entries = [HabitEntry]()
//    
//    
//    init() {
//        addMockData()
//    }
//    
//    func addMockData() {
//        entries.append(HabitEntry(content: "jag åt"))
//        entries.append(HabitEntry(content: "jag sov"))
//        entries.append(HabitEntry(content: "jag programmerade"))
//        
//        
//    }
//    
//    func update(entry : HabitEntry, with content: String) {
//        if let index = entries.firstIndex(of: entry) {
//            entries[index].content = content
//        }
//        
//    }
//    
//}
