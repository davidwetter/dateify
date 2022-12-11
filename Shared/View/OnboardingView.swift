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
        if #available(iOS 16.0, *) {
            Text("Willkommen zu Task-Manager")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 75.0)
            Spacer()
            
            HStack(alignment: .center, spacing: 20){
                Image("tasks")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(9)
                    .padding(.leading, 30)
                VStack{
                    Text("Tasks")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Lorem ipsum dolor sit amet, consetetur  elitr, sed diam nonumy eirmod tempor invidunt ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.secondary)
                    
                }.padding(.trailing, 20)
                
            }
            HStack(alignment: .center, spacing: 20){
                Image("tasks")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(9)
                    .padding(.leading, 30)
                VStack{
                    Text("Tasks")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Lorem ipsum dolor sit amet, consetetur  elitr, sed diam nonumy eirmod tempor invidunt ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.secondary)
                    
                }.padding(.trailing, 20)
                
            }
            HStack(alignment: .center, spacing: 20){
                Image("tasks")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(9)
                    .padding(.leading, 30)
                VStack{
                    Text("Tasks")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Lorem ipsum dolor sit amet, consetetur  elitr, sed diam nonumy eirmod tempor invidunt ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.secondary)
                    
                }.padding(.trailing, 20)
                
            }
            Spacer()
            StartButtonView()
        }
    }//: SCROLL
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        
    }
}

