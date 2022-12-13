//
//  ActivityIndicatorHelper.swift
//  Task Manager (iOS)
//
//  Created by David Wetter on 14.12.22.
//

import SwiftUI

struct ActivityIndicatorHelper: View {
    var body: some View {
        ProgressView()
         .progressViewStyle(CircularProgressViewStyle())
    }
}

struct ActivityIndicatorHelper_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorHelper()
    }
}
