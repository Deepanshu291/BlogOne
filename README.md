
# Flutter Blog App

A Flutter application for managing and displaying a list of blogs with the ability to mark blogs as favorites. This project utilizes Hive for local data persistence and Riverpod for state management.

## Features

- View a list of blogs.
- Mark blogs as favorites.
- View a separate page for favorite blogs.
- Offline support using Hive for local storage.

## Getting Started
### Screenshots

<p align="middle"> 
 <img src ="screenshots/sample.gif" width="180" height="360">
  <img src ="screenshots/ss1.png" width="180" height="360">
  <img src ="screenshots/ss2.png" width="180" height="360">
</p>

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)

### Installation

1. Clone the repository:

   ```bash
   https://github.com/Deepanshu291/SubSpace_blog_assignment
   ```

2. Navigate to the project folder:

   ```bash
   cd SubSpace_blog_assignment
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

### Usage

Run the app using:

```bash
flutter run
```

The app should open on your device or simulator.

### Folder Structure

```
|-- lib
|   |-- main.dart
|   |-- Models
|   |   |-- blogmodel.dart
|   |   |-- blogModel.g.dart
|   |-- Provider
|   |   |-- DataProvider.dart
|   |-- screens
|   |   |-- homepage.dart
|   |   |-- FavoriteBlogsPage.dart
|   |   |-- BlogPostpage.dart
|   |-- services
|   |   |-- apiservice.dart
|   |   |--favroiteblog.dart
|   |-- Components
|   |   |-- Blogcard.dart
|   |   |--loading.dart
```


## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvement, please open an issue or create a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
