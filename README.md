# Enpal Tech Challenge - Flutter Application

## Overview
This project is a data monitoring tool for users with solar energy systems generation, house and battery consumption. The goal is to create a Flutter mobile app that allows users to monitor their solar power generation and consumption through a graph-based interface.

## Architecture
The app follows **Clean Architecture** and uses the **MVVM** (Model-View-ViewModel) design pattern to separate concerns and maintain a scalable and testable codebase. State management is implemented using **Flutter Riverpod**. Networking is handled by **Dio** with **Retrofit**, and dependency injection is managed using **GetIt** and **Injectable**.

## Features Implemented

### Graph and Data Visualization
1. **Solar Generation**: Displays a line graph of solar generation over time.
2. **House Consumption**: Displays a line graph of household energy consumption.
3. **Battery Consumption**: Displays a line graph of battery energy consumption.

Each metric (solar generation, house consumption, battery consumption) has its dedicated tab, allowing users to switch between them and view data specific to each metric.

- **Line Chart**: The data is presented in a line chart where the x-axis represents datetime and the y-axis represents values in watts.
- **Date Filtering**: Users can filter the data based on a specific date.
- **Unit Switching**: Users can toggle between watts and kilowatts.
- **Preloading**: Data for each tab is preloaded to ensure fast graph rendering when switching between tabs.

### Caching
- **Data Caching**: Fetched data is cached to avoid re-fetching it every time.

### Error Handling
- **Error Feedback**: User-friendly error messages are displayed for connectivity issues or data request failures.

### Optional Features
- **Pull-to-refresh**: Users can refresh the data by pulling down on the screen.
- **Dark Mode**: The app supports dark mode for better user experience in low-light environments.

### Testing
- **Unit Tests**: Comprehensive unit tests are included for core business logic.
- **Widget Tests**: Widget tests are implemented to validate the UI components and interactions.
- To view all tests, run the following command in the terminal:
  ```bash
  flutter test --coverage
  ```

## Packages Used
- **State Management**: 
  - `flutter_riverpod`: 2.6.1
  - `riverpod_annotation`: 2.6.1
  - `rxdart`: 0.28.0

- **Network**:
  - `dio`: 5.8.0+1
  - `retrofit`: 4.4.2
  - `json_annotation`: 4.9.0

- **Dependency Injection**:
  - `get_it`: 8.0.3
  - `injectable`: 2.5.0

- **Routing**:
  - `go_router`: 14.8.0

- **Utilities**:
  - `equatable`: 2.0.7
  - `copy_with_extension`: 6.0.1
  - `collection`: 1.19.1
  - `flex_color_scheme`: 8.1.0
  - `connectivity_plus`: 6.1.3

- **Internationalization**:
  - `easy_localization`: 3.0.7+1

- **Charts**:
  - `fl_chart`: 0.70.2

## Environment Setup
To run this application, create a `.env.json` file in the root directory with the following content for Android emulator:
```json
{
    "API_URL": "http://10.0.2.2:3000"
}
```
Alternatively, replace `http://10.0.2.2:3000` with your API URL if you are using a different setup.

## Running the Application
To run the application, run the following command in the terminal:
```bash
flutter run --dart-define-from-file=.env.json
```

