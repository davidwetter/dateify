//
//  StartButtonView.swift
//  Task Manager (iOS)
//
//  Created by David Wetter on 10.12.22.
//

import Foundation
import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // MARK: - BODY
    
    var body: some View {
        Button("Weiter") {
            isOnboarding = false
        }
        .buttonStyle(.borderedProminent)
    }
}

// MARK: - PREVIEW

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
