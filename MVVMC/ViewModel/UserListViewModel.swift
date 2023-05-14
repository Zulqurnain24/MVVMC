//
//  UserListViewModel.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import Combine
import Foundation
import SwiftUI

protocol UserListViewModelProtocol: ObservableObject {
    associatedtype Destination: View
    func fetchUsers()
    func routeToDetailView(user: User) -> Destination
}

class UserListViewModel: UserListViewModelProtocol {
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    var coordinator: any Coordinatable
    
    private let userService: UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(userService: UserServiceProtocol = UserService(),
         coordinator: any Coordinatable = AppCoordinator()) {
        self.userService = userService
        self.coordinator = coordinator
    }
    
    func routeToDetailView(user: User) -> some View {
        AnyView(coordinator.navigateToUserDetail(user: user))
    }
    
    func fetchUsers() {
        isLoading = true
        userService.fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                },
                receiveValue: { [weak self] users in
                    self?.users = users
                }
            )
            .store(in: &cancellables)
    }
}
