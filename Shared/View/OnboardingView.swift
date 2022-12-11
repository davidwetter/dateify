//
//  OnboardingView.swift
//  Task Manager (iOS)
//
//  Created by David Wetter on 10.12.22.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    // MARK: - BODY
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSheet = false

    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    StartButtonView()
                }
            }
            
            .navigationBarTitle(Text("Neue Funktionen"), displayMode: .large)
            .navigationBarItems(
                trailing:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
            )
            .padding()
        }
        
    }//: SCROLL
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        
    }
}

