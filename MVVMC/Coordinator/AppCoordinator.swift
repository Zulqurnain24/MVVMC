//
//  AppCoordinator.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import SwiftUI

protocol Coordinatable {
    associatedtype Destination: View
    func navigateToUserDetail(user: User) -> Destination
    func navigateToUserList(viewModel: UserListViewModel) -> Destination
}

class AppCoordinator: Coordinatable {
    typealias Destination = AnyView
    
    func navigateToUserDetail(user: User) -> AnyView {
        Destination(UserDetailView(user: user))
    }
    
    func navigateToUserList(viewModel: UserListViewModel) -> AnyView {
        Destination(UserListView(viewModel: viewModel))
    }
}
