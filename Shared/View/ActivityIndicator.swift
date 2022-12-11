//
//  ActivityIndicator.swift
//  Task Manager (iOS)
//
//  Created by David Wetter on 11.12.22.
//

import SwiftUI

struct ActivityIndicator: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .cornerRadius(9)
        }
        ProgressView()
         .progressViewStyle(CircularProgressViewStyle())
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
