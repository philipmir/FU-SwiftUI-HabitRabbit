//
//  CheckHabit.swift
//  FU-HabitRabbit
//
//  Created by Philip Miranda on 2023-04-25.
//

import Foundation
import Firebase


class CheckHabitVM : ObservableObject {
    let db = Firestore.firestore()
    let auth = Auth.auth()
    
    @Published var habit = [Habit]()
    
    func delete(index : Int) {
        guard let user = auth.currentUser else {return}
        let habitRef = db.collection("users").document(user.uid).collection("habit")
        
        let item = habit[index]
        if let id = item.id {
            habitRef.document(id).delete()
        }
        
    }
    

    
    func toggle(habit: Habit) {
        guard let user = auth.currentUser else {return}
        let habitRef = db.collection("users").document(user.uid).collection("habit")

        var updatedHabit = habit
        updatedHabit.toggle()

        if let id = updatedHabit.id {
            do {
                try habitRef.document(id).setData(from: updatedHabit)
            } catch let error {
                print("Error updating item: \(error)")
            }
        }
    }
    
    

    
    
    func saveToFirestore(itemName : String) {
        guard let user = auth.currentUser else {return}
        let habitRef = db.collection("users").document(user.uid).collection("habit")
        
        
        
        let habit = Habit(name: itemName, done: false)
        
        do {
            try habitRef.addDocument(from: habit)
        } catch {
            print("Error saving to db")
        }
    }
    
    func listenToFirestore() {
        guard let user = auth.currentUser else {return}
        let habitRef = db.collection("users").document(user.uid).collection("habit")
        
        habitRef.addSnapshotListener() {
            snapshot, err in
            
            guard let snapshot = snapshot else {return}
            
            if let err = err {
                print("error getting document) \(err)")
            } else {
                self.habit.removeAll()
                for document in snapshot.documents {
                    
                    do {
                        let habit = try document.data(as: Habit.self)
                        self.habit.append(habit)
                    } catch {
                        print("Error reading from db")
                    }
                    
                }
            }
        }
    }
  }
    



