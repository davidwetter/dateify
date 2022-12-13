//
//  Home.swift
//  Task Manager (iOS)
//
//  Created by David Wetter on 02/05/22.
//

import SwiftUI

struct Home: View {
    @StateObject var taskModel: TaskViewModel = .init()
    // MARK: Matched Geometry Namespace
    @Namespace var animation
    
    // MARK: Fetching Task
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.deadline, ascending: false)], predicate: nil, animation: .easeInOut) var tasks: FetchedResults<Task>
    
    // MARK: Environment Values
    @Environment(\.self) var env
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @Environment(\.colorScheme) var colorScheme

    let colorStops: [Gradient.Stop] = [
        .init(color: Color(UIColor.systemBackground).opacity(0.1), location: 0.05),
        .init(color: Color(UIColor.systemBackground).opacity(0.2), location: 0.1),
        .init(color: Color(UIColor.systemBackground).opacity(0.3), location: 0.2),
        .init(color: Color(UIColor.systemBackground).opacity(0.4), location: 0.3),
        .init(color: Color(UIColor.systemBackground).opacity(0.5), location: 0.4),
        .init(color: Color(UIColor.systemBackground).opacity(0.6), location: 0.5),
        .init(color: Color(UIColor.systemBackground).opacity(0.7), location: 0.6),
        .init(color: Color(UIColor.systemBackground).opacity(0.8), location: 0.7),
        .init(color: Color(UIColor.systemBackground).opacity(0.9), location: 0.8),
        .init(color: Color(UIColor.systemBackground), location: 0.9)
    ]
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                VStack(alignment: .leading, spacing: 8) {
                    Text("Willkommen zurück")
                        .font(.callout)
                    Text("Hier ist das heutige Update.")
                        .font(.title2.bold())
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.vertical)
                
                CustomSegmentedBar()
                    .padding(.top,5)
                
                // MARK: Task View
                TaskView()
            }
        }
                .padding()
                .overlay(alignment: .bottom) {
                    // MARK: Add Button
                    Button {
                        taskModel.openEditTask.toggle()
                    } label: {
                        Label {
                            Text("Aufgabe hinzufügen")
                                .font(.callout)
                                .fontWeight(.semibold)
                        } icon: {
                            Image(systemName: "plus.app.fill")
                        }
                        .foregroundColor(Color(UIColor.systemBackground))
                        .padding(.vertical,12)
                        .padding(.horizontal)
                        .background(colorScheme == .dark ? Color.white : Color.black,in: Capsule())
                    }
                    // MARK: Linear Gradient BG
                    .padding(.top,10)
                    .frame(maxWidth: .infinity)
                    .background{
                        Color(UIColor.systemBackground)
//                        LinearGradient(stops: colorStops, startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    }
                }
                .fullScreenCover(isPresented: $taskModel.openEditTask) {
                    taskModel.resetTaskData()
                } content: {
                    AddNewTask()
                        .environmentObject(taskModel)
                }
                .sheet(isPresented: $isOnboarding) {
                    OnboardingView()
                }
            
        }
        // MARK: TaskView
        @ViewBuilder
        func TaskView()->some View{
            LazyVStack(spacing: 20){
                // MARK: Custom Filtered Request View
                // See My Dynamic Filter Video
                // Link in Description
                DynamicFilteredView(currentTab: taskModel.currentTab) { (task: Task) in
                    TaskRowView(task: task)
                }
            }
            .padding(.top,20)
        }
        
        // MARK: Task Row View
        @ViewBuilder
        func TaskRowView(task: Task)->some View{
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Text(task.type ?? "")
                        .font(.callout)
                        .padding(.vertical,5)
                        .padding(.horizontal)
                        .background{
                            Capsule()
                                .fill(.white.opacity(0.3))
                        }
                    
                    Spacer()
                    
                    // MARK: Edit Button Only for Non Completed Tasks
                    if !task.isCompleted && taskModel.currentTab != "Failed"{
                        Button {
                            taskModel.editTask = task
                            taskModel.openEditTask = true
                            taskModel.setupTask()
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.primary)
                        }
                    }
                }
                
                Text(task.title ?? "")
                    .font(.title2.bold())
                    .foregroundColor(Color(UIColor.systemBackground))
                    .padding(.vertical,10)
                
                HStack(alignment: .bottom, spacing: 0) {
                    VStack(alignment: .leading, spacing: 10) {
                        Label {
                            Text((task.deadline ?? Date()).formatted(date: .long, time: .omitted))
                        } icon: {
                            Image(systemName: "calendar")
                        }
                        .font(.caption)
                        
                        Label {
                            Text((task.deadline ?? Date()).formatted(date: .omitted, time: .shortened))
                        } icon: {
                            Image(systemName: "clock")
                        }
                        .font(.caption)
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    if !task.isCompleted && taskModel.currentTab != "Failed"{
                        Button {
                            // MARK: Updating Core Data
                            task.isCompleted.toggle()
                            try? env.managedObjectContext.save()
                        } label: {
                            Circle()
                                .strokeBorder(.black,lineWidth: 1.5)
                                .frame(width: 25, height: 25)
                                .contentShape(Circle())
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background{
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color(task.color ?? "Yellow"))
            }
        }
        
        // MARK: Custom Segmented Bar
        @ViewBuilder
        func CustomSegmentedBar()->some View{
            // In Case if we Missed the Task
            let tabs = ["Heute","Geplant","Erledigt","Fehler"]
            HStack(spacing: 0){
                ForEach(tabs,id: \.self){tab in
                    Text(tab)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .scaleEffect(0.9)
                        .foregroundColor(taskModel.currentTab == tab ? Color(UIColor.systemBackground) : .primary)
                        .padding(.vertical,6)
                        .frame(maxWidth: .infinity)
                        .background{
                            if taskModel.currentTab == tab{
                                Capsule()
                                    .fill(.primary)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                        .contentShape(Capsule())
                        .onTapGesture {
                            withAnimation{taskModel.currentTab = tab}
                        }
                }
            }
        }
    }
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
