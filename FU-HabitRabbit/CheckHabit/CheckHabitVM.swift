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
    
    @Published var items = [Item]()
    
    func delete(index : Int) {
        guard let user = auth.currentUser else {return}
        let itemsRef = db.collection("users").document(user.uid).collection("items")
        
        let item = items[index]
        if let id = item.id {
            itemsRef.document(id).delete()
        }
        
    }
    
    
//    func toggle(item: Item) {
//
//        guard let user = auth.currentUser else {return}
//        let itemsRef = db.collection("users").document(user.uid).collection("items")
//
//
//        if let id = item.id {
//            itemsRef.document(id).updateData(["done" : !item.done])
//        }
//
//    }
    
    func toggle(item: Item) {
        guard let user = auth.currentUser else {return}
        let itemsRef = db.collection("users").document(user.uid).collection("items")

        var updatedItem = item
        updatedItem.toggle()

        if let id = updatedItem.id {
            do {
                try itemsRef.document(id).setData(from: updatedItem)
            } catch let error {
                print("Error updating item: \(error)")
            }
        }
    }
    
    

    
    
    func saveToFirestore(itemName : String) {
        guard let user = auth.currentUser else {return}
        let itemsRef = db.collection("users").document(user.uid).collection("items")
        
        
        
        let item = Item(name: itemName, done: false)
        
        do {
            try itemsRef.addDocument(from: item)
        } catch {
            print("Error saving to db")
        }
    }
    
    func listenToFirestore() {
        guard let user = auth.currentUser else {return}
        let itemsRef = db.collection("users").document(user.uid).collection("items")
        
        itemsRef.addSnapshotListener() {
            snapshot, err in
            
            guard let snapshot = snapshot else {return}
            
            if let err = err {
                print("error getting document) \(err)")
            } else {
                self.items.removeAll()
                for document in snapshot.documents {
                    
                    do {
                        let item = try document.data(as: Item.self)
                        self.items.append(item)
                    } catch {
                        print("Error reading from db")
                    }
                    
                }
            }
        }
    }
  }
    



