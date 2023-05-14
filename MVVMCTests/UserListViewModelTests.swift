//
//  MVVMCTests.swift
//  MVVMCTests
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import XCTest
import Combine
@testable import MVVMC

class UserListViewModelTests: XCTestCase {
    
    var sut: UserListViewModel!
    var mockUserService: MockUserService!
    var mockCoordinator: MockAppCoordinator!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        mockUserService = MockUserService()
        mockCoordinator = MockAppCoordinator()
        sut = UserListViewModel(userService: mockUserService, coordinator: mockCoordinator)
    }
 
    func testFetchUsers() {
        let expectation = self.expectation(description: "Users fetched")
        
        // Given
        let users = [User.mock()]
        mockUserService.users = users
        
        // When
        sut.fetchUsers()
        
        // Then
        XCTAssertTrue(sut.isLoading)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            // Then
            XCTAssertFalse(self?.sut.isLoading ?? true)
            XCTAssertEqual(self?.sut.users.count, 1)
            XCTAssertEqual(self?.sut.users.first?.name, "John")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testRouteToDetailView() {
        let expectation = self.expectation(description: "Route To DetailView")
        _ = sut.routeToDetailView(user: User.mock())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            // Then
            XCTAssertTrue(self?.mockCoordinator.userDetailViewCallsCount == 1)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    override func tearDown() {
        sut = nil
        mockUserService = nil
        mockCoordinator = nil
        cancellables = []
        super.tearDown()
    }
}
