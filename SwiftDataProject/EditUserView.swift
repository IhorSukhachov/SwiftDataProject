//
//  EditUser.swift
//  SwiftDataProject
//
//  Created by Ihor Sukhachov on 10.12.2025.
//
import SwiftData
import SwiftUI

struct EditUser: View {
    @Bindable var user: User
    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            DatePicker("Join Date", selection: $user.joinDate)
           
        }
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configuration: config)
        let user = User(name: "Ihor", city: "Kiev", joinDate: .now)
        
        return EditUser(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to preview, \(error.localizedDescription)")
    }
   
}
