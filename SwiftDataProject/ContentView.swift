//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Ihor Sukhachov on 10.12.2025.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly: Bool = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    //    @Query(filter: #Predicate<User> {user in
    //        user.name.localizedStandardContains("o") &&
    //        user.city == "Kiev"
    //    }, sort: \User.name) var users: [User]
    //   @State private var path = [User]()
    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder )
                .navigationTitle("Users")
            //            .navigationDestination(for: User.self) {user in
            //                EditUserView(user: user)
            
                .toolbar {
                    Button("Add samples", systemImage: "plus") {
                        //                    let user = User(name: "", city: "", joinDate: .now)
                        //                    modelContext.insert(user)
                        //                    path = [user]
                        try? modelContext.delete(model: User.self)
                        
                        let first = User(name: "Ihor", city: "Kiev", joinDate: .now.addingTimeInterval(86400 * -10)) //ten days in the psst
                        let second = User(name: "Sasha", city: "Poltava", joinDate: .now.addingTimeInterval(86400 * -5))
                        let third = User(name: "Oleg", city: "Lviv", joinDate: .now.addingTimeInterval(86400 * 5))
                        let forth = User(name: "Johny", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                        
                        modelContext.insert(first)
                        modelContext.insert(second)
                        modelContext.insert(third)
                        modelContext.insert(forth)
                    }
                    Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming" ) {
                        showingUpcomingOnly.toggle()
                    }
                    
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\User.name),
                                
                                SortDescriptor(\User.joinDate)
                            ])
                        Text("Sort by join date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
        }
    }
}


#Preview {
    ContentView()
}
