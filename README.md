# Flutter Weather App
This is a simple weather app built using Flutter that demonstrates the Clean Architecture principles and Test-Driven Development (TDD) approach. The app allows users to retrieve and display the current weather conditions for a specific city.

## Features
- Users can enter a city name to retrieve weather data.
- The app displays the current temperature, humidity, and weather description for the specified city.

## Project Structure
The project follows a clean and organized folder structure to promote maintainability and separation of concerns. The structure consists of the following key directories:

- lib/core: Contains core business logic and shared functionality.
  - usecases: Holds the Use Case classes (business logic).
  - errors: Defines custom error classes or failure types.
    
- lib/data: Handles data-related operations, such as API calls and data storage.
  - datasources: Contains data sources, such as remote APIs or local databases.
  - repositories: Provides an abstraction over data sources and handles data retrieval and caching.

- lib/domain: Represents the core domain of the application.
  - entities: Defines the core data models or entities.
  - repositories: Provides the repository contract from the domain layer.

- lib/presentation: Handles UI and presentation logic.
  - bloc: Contains the BLoC classes (if used).
  - pages: Holds the UI pages/screens.
  - test: Contains test files corresponding to each layer, mirroring the main code structure.

## Getting Started
Clone this repository to your local


Install the required dependencies:
  - ```bash flutter pub get```

Start the app by running:
  - ```bash flutter run```

Testing:
  - ```bash flutter test```
