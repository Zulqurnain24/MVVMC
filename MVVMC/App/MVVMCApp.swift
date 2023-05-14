//
//  MVVMCApp.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import Combine
import SwiftUI

@main
struct MVVMCApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoordinator().navigateToUserList(viewModel: UserListViewModel())
        }
    }
}
