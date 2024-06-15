# Android Automation Framework

## Description
This project is a general-purpose test automation framework tailored for Android applications. It utilizes a combination of technologies including Cucumber-JVM, Selenium, and Appium to provide a robust testing environment. The framework follows the Page Object Model (POM) practice to ensure maintainability and reusability of the code.

## Features
- **BDD with Cucumber**: Leverage Behavior Driven Development to write clear and understandable tests.
- **Appium Integration**: Automate interaction with Android devices and emulators.
- **JUnit Integration**: Utilize JUnit for assertions and test lifecycle management.
- **Cucumber Reports**: Generate beautiful reports using Cucumber.
- **Page Object Model**: Organize code into page-specific models to separate test logic from layout code.

## Prerequisites
- Java 1.8
- Maven
- Android SDK and tools
- Appium Desktop/Server
- Any IDE with support for Java (e.g., IntelliJ IDEA, Eclipse)
- A physical device or Android emulator

## Installation
1. **Clone the repository**:
- git clone https://github.com/yourrepository/android-framework.git
- cd repository

2. **Set up Appium**:
- Download and install Appium 
- Ensure that Appium server is up and running on your system.

3. **Configure Android SDK**:
- Download and set up Android SDK and necessary tools.
- Configure environment variables such as `ANDROID_HOME`.

4. **Build the project**:
- mvn clean install

5. **Connect your Android device or start an emulator**:
- Connect your Android device via USB and enable USB debugging.
- Or, start an Android emulator from Android Studio or the command line.

## Test Configuration
Tests are configured to run using the `MobileRunner` class. Cucumber options in this class define the features and glue code locations along with plugins for reporting:
- **Features**: `src/test/resources/features/app/android/HomePage.feature`
- **Glue**: `step_defination`
- **Plugins**: Generates pretty reports