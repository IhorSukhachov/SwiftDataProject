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
    @Query(filter: #Predicate<User> {user in
        user.name.contains("o")
    }, sort: \User.name) var users: [User]
    //   @State private var path = [User]()
    var body: some View {
        NavigationStack {
            List(users) {user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
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
            }
        }
    }
}


#Preview {
    ContentView()
}
