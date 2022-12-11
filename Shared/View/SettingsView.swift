//
//  SettingsView.swift
//  Task Manager (iOS)
//
//  Created by David Wetter on 10.12.22.
//

import Foundation
import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  
  @Environment(\.presentationMode) var presentationMode
  @AppStorage("isOnboarding") var isOnboarding: Bool = false
  
  // MARK: - BODY

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20) {
          // MARK: - SECTION 1
          
          GroupBox(
            label:
              SettingsLabelView(labelText: "Task-Manager", labelImage: "info.circle")
          ) {
            Divider().padding(.vertical, 4)
            
            HStack(alignment: .center, spacing: 10) {
              Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(9)
              
              Text("Haben Sie eine Idee? Holen Sie sich Task-Manager. Gleich, ob Sie Ihre Produktivität steigern möchten, mit Aufgabenmanager wird es einfach, Ihren Tag zu planen und Ihr Leben zu managen.")
                .font(.footnote)
            }
          }
          
          // MARK: - SECTION 2
          
          GroupBox(
            label: SettingsLabelView(labelText: "Personalisierung", labelImage: "paintbrush")
          ) {
            Divider().padding(.vertical, 4)
            
            Text("Wenn Sie möchten, können Sie die Anwendung neu starten, indem Sie den Schalter in diesem Feld umlegen. Auf diese Weise wird der Einführungsprozess gestartet und Sie sehen wieder den Begrüßungsbildschirm.")
              .padding(.vertical, 8)
              .frame(minHeight: 60)
              .layoutPriority(1)
              .font(.footnote)
              .multilineTextAlignment(.leading)
            
            Toggle(isOn: $isOnboarding) {
              if isOnboarding {
                Text("Neugestartet".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(Color.green)
              } else {
                Text("Neustart".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(Color.secondary)
              }
            }
            .padding()
            .background(
              Color(UIColor.tertiarySystemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            )
          }
          
          // MARK: - SECTION 3
          
          GroupBox(
            label:
            SettingsLabelView(labelText: "Applikation", labelImage: "apps.iphone")
          ) {
            SettingsRowView(name: "Entwickler", content: "David Wetter")
            SettingsRowView(name: "Designer", content: "David Wetter")
            SettingsRowView(name: "Kompatibilität", content: "iOS 16")
            SettingsRowView(name: "Website", linkLabel: "David Wetter", linkDestination: "wetter.sg")
            SettingsRowView(name: "Instagram", linkLabel: "@wetter.david", linkDestination: "instagram.com/wetter.david/")
            SettingsRowView(name: "SwiftUI", content: "4")
            SettingsRowView(name: "Version", content: "1.1.0")
          }
          
        } //: VSTACK
        .navigationBarTitle(Text("Einstellungen"), displayMode: .large)
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
      } //: SCROLL
    } //: NAVIGATION
  }
}
