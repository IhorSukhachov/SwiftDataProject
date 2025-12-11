//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Ihor Sukhachov on 11.12.2025.
//
import SwiftData
import SwiftUI

struct UsersView: View {
    @Query  var users: [User]
    
    var body: some View {
        List(users) {user in
            Text(user.name)
        }
    }
}

#Preview {
    UsersView()
        .modelContainer(for: User.self)
}
