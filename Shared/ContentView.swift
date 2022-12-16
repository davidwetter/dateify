//
//  ContentView.swift
//  Shared
//
//  Created by David Wetter on 02/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingAddNewTask: Bool = false
    
    var body: some View {
        TabView {
            NavigationView{
                Home()
                    .navigationBarTitle("Task-Manager")
                    .navigationBarItems(
                        trailing:
                            Button(action: {
                                isShowingAddNewTask = true
                            }) {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.primary)
                            } //: BUTTON
                            .sheet(isPresented: $isShowingAddNewTask) {
                                AddNewTask()
                            }
                    )
                
            }
            .tabItem { //note how this is modifying `NavigationView`
                Image(systemName: "list.bullet.clipboard.fill")
                Text("Tasks")
            }
            
            
            NavigationView {
                CalenderView()
                    .navigationBarTitle("Kalender")
            }
            .tabItem { //note how this is modifying `NavigationView`
                Image(systemName: "calendar")
                Text("Kalender")
            }
            
            
                SettingsView()
                    .navigationBarTitle("Kalender")
            .tabItem { //note how this is modifying `NavigationView`
                Image(systemName: "gear")
                Text("Einstellungen")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
