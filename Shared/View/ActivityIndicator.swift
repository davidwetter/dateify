//
//  ActivityIndicator.swift
//  Task Manager (iOS)
//
//  Created by David Wetter on 11.12.22.
//

import SwiftUI

struct ActivityIndicator: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .cornerRadius(20)
        
        ProgressView()
         .progressViewStyle(CircularProgressViewStyle())
        }.sheet(isPresented: $isOnboarding) {
            OnboardingView()
            }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
