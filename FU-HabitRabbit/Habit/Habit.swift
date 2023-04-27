////
////  Habit.swift
////  FU-HabitRabbit
////
////  Created by Philip Miranda on 2023-04-23.
////
//
//import SwiftUI
//import Firebase
//
//struct Habit:  View {
//
//    @EnvironmentObject var habit : HabitViewModel
//
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List() {
//                    ForEach(habit.entries) { entry in
//                        NavigationLink(destination:
//                                        HabitEntryView (entry: entry)) {
//                            RowView(entry : entry)
//                        }
//                    }
//                }
//            }
//
//
//            .navigationTitle("Habit")
//
//
//
//
//            .navigationBarItems( leading:
//
//                                    NavigationLink(destination: CheckHabitView()) {
//                Text("CheckHabit")
//
//            },
//
//
//                                 trailing: NavigationLink(destination: HabitEntryView()) {
//
//                    Image(systemName: "plus.circle")
//
//            })
//
//        }
//    }
//}
//
//
//
//struct RowView: View {
//    let entry : HabitEntry
//
//    var body: some View {
//        HStack {
//            Text(entry.date)
//            Spacer()
//            Text(entry.content.prefix(7)+"...")
//        }
//    }
//}
//
//struct Habit_Previews: PreviewProvider {
//
//    static var previews: some View {
//        Habit()
//    }
//}
