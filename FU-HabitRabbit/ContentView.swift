//
//  ContentView.swift
//  FU-HabitRabbit
//
//  Created by Philip Miranda on 2023-04-23.
//

import SwiftUI
import Firebase

struct ContentView : View {
    
    
//    @EnvironmentObject var journal : HabitViewModel
    
    @State var signedIn = false
    
    var body: some View {
        
//        HabitRabbitView()
        

        
        if !signedIn {
            SignInView(signedIn: $signedIn)
        } else {
            CheckHabitView()
        }
        
    }
}

struct SignInView : View {
    @Binding var signedIn : Bool
    var auth = Auth.auth()
    
    var body: some View {
        ZStack {
            Color(red: 255/255, green: 230/255, blue: 230/255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "hare.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .padding()
                Text("Habit Rabbit")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Button(action: {
                    auth.signInAnonymously { result, error in
                        if let error = error {
                            print("error signing in")
                        } else {
                            signedIn = true
                        }
                    }
                }) {
                    Text("Sign in")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .font(.headline)
                }
                .background(Color.pink)
                .cornerRadius(10)
                .padding(.top, 50)
            }
        }
    }
}

struct HabitRabbitView: View {
    var body: some View {
        ZStack {
            Color(red: 255/255, green: 230/255, blue: 230/255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "hare.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .padding()
                Text("Habit Rabbit")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
