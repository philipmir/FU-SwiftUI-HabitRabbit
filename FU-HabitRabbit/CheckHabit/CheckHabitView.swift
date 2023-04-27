//
//  CheckHabitView.swift
//  FU-HabitRabbit
//
//  Created by Philip Miranda on 2023-04-25.
//

import SwiftUI
import Firebase




struct CheckHabitView: View {
    
//    @EnvironmentObject var habit : HabitViewModel
    
    
    @StateObject var checkHabitVM = CheckHabitVM()
    @State var showingAddAlert = false
    @State var newItemName = ""
    
    
    var body: some View {
        VStack {
            List {
                ForEach(checkHabitVM.items) { item in
                    RowView2(item : item, vm :checkHabitVM)
                    
                }.onDelete() { IndexSet in
                    for index in IndexSet {
                        checkHabitVM.delete(index: index)
                    }
                }
            }

            Button(action: {
                showingAddAlert = true
            }) {
                Text("Add")
            }

            .alert("Lägg till", isPresented: $showingAddAlert) {
                TextField("Lägg till", text: $newItemName)
                
                
                Button("Add", action: {
                    checkHabitVM.saveToFirestore(itemName: newItemName)
                    newItemName = ""
                })
            }
        }
        
        .onAppear() {
            checkHabitVM.listenToFirestore()
            
        }
    }
}
    

struct RowView2: View {
    let item : Item
    let vm : CheckHabitVM
    
    
    
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Text("\(item.streak )")
            Button(action: {
                vm.toggle(item: item)
                
            }) {
                Image(systemName: item.done ? "checkmark.square" : "square")
            }
            
        }
    }
}

struct Habit {
    var name: String
    var currentStreak: Int = 0
    var latestDone: Date

    mutating func markAsDone() {
        let today = Date()
        let calendar = Calendar.current
        let yesterday = calendar.date(byAdding: .day, value: -1, to: today)!

        if calendar.isDate(latestDone, inSameDayAs: today) {
            // latestDone is today, do nothing
        } else if calendar.isDate(latestDone, inSameDayAs: yesterday) {
            // latestDone is yesterday, increase currentStreak and set latestDone to today
            currentStreak += 1
            latestDone = today
        } else {
            // latestDone is older than yesterday, reset currentStreak to 1 and set latestDone to today
            currentStreak = 1
            latestDone = today
        }
    }
}







struct CheckHabitView_Previews: PreviewProvider {
    static var previews: some View {
        CheckHabitView()
    }
}

