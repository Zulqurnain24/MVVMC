//
//  UserDetailView.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(user.name)
                .font(.title)
            
            Text("Username: \(user.username)")
                .font(.headline)
            
            Text("Email: \(user.email)")
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(user.name), displayMode: .inline)
    }
}
