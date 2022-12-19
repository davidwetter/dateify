//
//  ContentView.swift
//  Shared
//
//  Created by David Wetter on 02/05/22.
//

import SwiftUI
import StoreKit
struct ContentView: View {
    
    @State private var isShowingAddNewTask: Bool = false
    @StateObject var storeManager = StoreManager()

    let productIDs = [
            //Use your product IDs instead
            "ch.davidwetter.taskios.store.chf1",
            "ch.davidwetter.taskios.store.chf3",
            "ch.davidwetter.taskios.store.chf5"
        ]
    
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
            
            
                SettingsView(storeManager: storeManager)
                    .navigationBarTitle("Kalender")
                    .onAppear(perform: {
                                       SKPaymentQueue.default().add(storeManager)
                                       storeManager.getProducts(productIDs: productIDs)
                                   })
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
