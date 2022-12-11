//
//  SettingsLabelView.swift
//  Task Manager (iOS)
//
//  Created by David Wetter on 10.12.22.
//

import Foundation
import SwiftUI

struct SettingsLabelView: View {
  // MARK: - PROPERTIES
  
  var labelText: String
  var labelImage: String

  // MARK: - BODY

  var body: some View {
    HStack {
      Text(labelText.uppercased()).fontWeight(.bold)
      Spacer()
      Image(systemName: labelImage)
    }
  }
}
struct SettingsLabelView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsLabelView(labelText: "Task-Manager", labelImage: "info.circle")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
