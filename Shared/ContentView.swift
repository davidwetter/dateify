//
//  ContentView.swift
//  Shared
//
//  Created by David Wetter on 02/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingSettings: Bool = false
    
    var body: some View {
        NavigationView{
            Home()
                .navigationBarTitle("Task-Manager")
                .navigationBarItems(
                  trailing:
                    Button(action: {
                      isShowingSettings = true
                    }) {
                      Image(systemName: "gear")
                            .foregroundColor(.primary)
                    } //: BUTTON
                    .sheet(isPresented: $isShowingSettings) {
                      SettingsView()
                    }
                )

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
