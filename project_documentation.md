# Hidden Bar Project Documentation

## 1. Project Overview

Hidden Bar is a macOS application that lets you hide menu bar items to give your Mac a cleaner look. It is written in Swift and uses the AppKit framework. The application is available on the Mac App Store and can also be installed using Homebrew.

## 2. Project Structure

The project is organized into two main targets:

* **Hidden Bar:** The main application target.
* **LauncherApplication:** A helper application used to launch the main application at login.

The source code is located in the `hidden/` directory and is structured as follows:

* **`AppDelegate.swift`**: The main entry point of the application.
* **`Features/`**: Contains the core features of the application, such as the status bar controller and the preferences view controller.
* **`Common/`**: Contains utility and helper classes.
* **`Extensions/`**: Contains extensions to standard Swift and AppKit classes.
* **`Models/`**: Contains the data models used in the application.
* **`Views/`**: Contains custom views.
* **`Assets.xcassets/`**: Contains the application's assets, such as icons and images.
* **`*.lproj/`**: Contains the localization files for the different languages supported by the application.

## 3. Core Components

### `AppDelegate.swift`

This is the main entry point of the application. It is responsible for:

* Initializing the `StatusBarController`.
* Setting up the global hotkey for toggling the hidden menu bar items.
* Setting up auto-start.
* Registering default user preferences.
* Opening the preferences window on first launch.

### `StatusBarController.swift`

This is the core component of the application. It is responsible for:

* Managing the status bar items used to hide and show the other menu bar items.
* Implementing the logic for expanding and collapsing the menu bar.
* Implementing the auto-collapse feature.
* Providing a context menu with options to open preferences and toggle auto-collapse.
* Managing the "always hidden" section of the menu bar.

### `PreferencesViewController.swift`

This view controller manages the user interface for the application's preferences. It allows the user to configure the following settings:

* Launch the application on login.
* Automatically hide the menu bar items.
* Show the preferences window on launch.
* Enable the "always hidden" section.
* Show the full status bar when expanded.
* The delay for auto-hiding.
* The global hotkey to toggle the hidden items.

## 4. Features

* **Hide/Show Menu Bar Items:** The core feature of the application. It allows the user to hide and show menu bar items by clicking on a status bar icon or by using a global hotkey.
* **Auto-collapse:** The application can automatically collapse the menu bar after a certain period of inactivity.
* **Always Hidden Section:** The application provides an "always hidden" section of the menu bar for items that the user never wants to see.
* **Global Hotkey:** The user can set a global hotkey to toggle the hidden menu bar items.
* **Launch on Login:** The application can be configured to launch automatically at login.
* **Localization:** The application is localized in several languages.

## 5. Dependencies

The project uses the Swift Package Manager to manage its dependencies. It has one dependency:

* **[HotKey](https://github.com/soffes/HotKey):** A library for creating global hotkeys in macOS applications.

## 6. Localization

The application is localized in the following languages:

* English
* Chinese (Simplified)
* Japanese
* Chinese (Traditional)
* French
* Vietnamese
* Arabic
* German
* Croatian
