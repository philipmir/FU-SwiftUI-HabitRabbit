////
////  HabitEntryView.swift
////  FU-HabitRabbit
////
////  Created by Philip Miranda on 2023-04-23.
////
//
//import SwiftUI
//
//struct HabitEntryView: View {
//    var entry : HabitEntry?
//    @EnvironmentObject var habit : HabitViewModel
//    
//    @State var content : String = ""
//    
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        VStack {
//            TextEditor(text: $content)
//        }
//        .onAppear(perform: setContent)
//        .navigationBarItems(trailing: Button("Save") {
//            saveEntry()
//            presentationMode.wrappedValue.dismiss()
//                
//        })
//    }
//    
//    private func setContent() {
//        if let entry = entry {
//            content = entry.content
//        }
//        
//    }
//    
//    private func saveEntry() {
//        
//        if let entry = entry {
//            // uppdatera gammal anteckning
//            habit.update(entry: entry, with: content)
//        }else {
//            //skapa en ny anteckning
//            let newEntry = HabitEntry(content: content)
//            habit.entries.append(newEntry)
//        }
//        
//        
//        
//        
//    }
//    
//    
//}
//
//struct JournalEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HabitEntryView()
//    }
//}
