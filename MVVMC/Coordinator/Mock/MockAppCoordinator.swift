//
//  MockAppCoordinator.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import SwiftUI

class MockAppCoordinator: Coordinatable {
    typealias Destination = AnyView
    
    var userDetailViewCallsCount = 0
    var userListCallsCount = 0
    
    func navigateToUserDetail(user: User) -> AnyView {
        userDetailViewCallsCount += 1
        return AnyView(EmptyView())
    }
    
    func navigateToUserList(viewModel: UserListViewModel) -> AnyView {
        userListCallsCount += 1
        return AnyView(EmptyView())
    }
}
