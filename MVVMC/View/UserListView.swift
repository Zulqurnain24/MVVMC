//
//  ContentView.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: UserListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                NavigationLink(destination: viewModel.routeToDetailView(user: user)) {
                    Text(user.name)
                }
            }
            .navigationBarTitle("Users")
        }.onAppear(perform: viewModel.fetchUsers)
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: UserListViewModel())
    }
}
