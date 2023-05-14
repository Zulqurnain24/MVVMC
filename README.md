# MVVMC #
This is the demonstration of MVVMC based networking application with swiftui and combine. 

## The main components of the MVVMC architecture are: ##

Model: Represents the data layer of the application. It encapsulates the data and the logic to manipulate it. It is usually implemented using classes or structs.
View: Represents the user interface layer of the application. It is responsible for displaying the data to the user and handling user interactions. In SwiftUI, views are usually implemented using structs.
ViewModel: Serves as a mediator between the View and the Model. It exposes the data to the View, encapsulates the business logic, and handles the user interactions. In MVVM, the ViewModel is typically implemented using classes.
Coordinator: Handles the navigation flow between the views. It decides which view should be presented next based on the user actions or the application logic. It can also pass data between views. In MVVMC, the Coordinator is usually implemented using a class.

## Diagram ##

+-----------------+       +---------------+       +----------------+
|     View        | <---  |   ViewModel   | <---  |     Model      |
+-----------------+       +---------------+       +----------------+
       |                           |                           |
       |                           |                           |
       |    +-----------------+    |                           |
       +--->|   Coordinator   |<---+                           |
            +-----------------+                                |
                       |                                       |
                       +---------------------------------------+
