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
        NavigationView {
            VStack {
                List {
                    ForEach(checkHabitVM.habit) { habit in
                        RowView2(habit: habit, vm: checkHabitVM)
                    }
                    .onDelete() { IndexSet in
                        for index in IndexSet {
                            checkHabitVM.delete(index: index)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                Button(action: {
                    showingAddAlert = true
                }) {
                    Text("Add")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(10)
                }
                .padding(.top, 16)
                
                .alert("Lägg till", isPresented: $showingAddAlert) {
                    TextField("Lägg till", text: $newItemName)
                    Button("Add", action: {
                        checkHabitVM.saveToFirestore(itemName: newItemName)
                        newItemName = ""
                    })
                }
            }
            .navigationTitle("Check Habits")
            .background(Color(red: 255/255, green: 230/255, blue: 230/255).edgesIgnoringSafeArea(.all))
        }
        .onAppear() {
            checkHabitVM.listenToFirestore()
            
        }
    }
}


struct RowView2: View {
    let habit: Habit
    let vm: CheckHabitVM
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text(habit.name)
                    .font(.headline)
                Text("Habit Streak: \(habit.streak)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            Button(action: {
                vm.toggle(habit: habit)
            }) {
                Image(systemName: habit.done ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.blue)
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 8)
    }
}

func testStreak() {
    var habit = Habit(name: "Exercise", done: false, lastDoneDate: nil)
    print("Initial streak: \(habit.streak)") // 0
    
    // Mark the habit as done today
    habit.toggle()
    print("Streak after marking as done: \(habit.streak)") // 1
    print("Last done date: \(habit.lastDoneDate!)") // Current date
    
    // Mark the habit as done again tomorrow
    habit.lastDoneDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
    habit.toggle()
    print("Streak after marking as done again: \(habit.streak)") // 2
}





struct CheckHabitView_Previews: PreviewProvider {
    static var previews: some View {
        CheckHabitView()
    }
}


