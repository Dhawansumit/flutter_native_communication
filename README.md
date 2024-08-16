# Flutter Native Communication POC
This project demonstrates a Flutter application that integrates with native Android and iOS code, specifically handling a native login screen. Upon a successful login, the user data is passed to a Flutter home screen.

# Table of Contents
    Getting Started
    Project Structure
    Android Implementation
    iOS Implementation
    Flutter Implementation
    Conclusion
    Getting Started
    Clone the repository and ensure you have Flutter, Android Studio, and Xcode set up on your machine.

# Prerequisites
  Flutter SDK
  Android Studio
  Xcode
# Project Structure
  android/app/src/main/java/.../MainActivity.java: Configures a method channel for Flutter to Android communication.
  android/app/src/main/java/.../LoginActivity.java: Handles the native Android login logic.
  ios/Runner/AppDelegate.swift: Sets up the method channel for Flutter to iOS communication.
  ios/Runner/LoginViewController.swift: Handles the native iOS login logic.
  lib/main.dart: Contains the Flutter logic for invoking native code and handling the response.
  lib/HomeScreen.dart: Displays the home screen with the user data received from the native login.

# Android Implementation
  MainActivity.java:
  
  Set up a method channel to listen for Flutter method calls.
  Handle the showLogin method to navigate to LoginActivity.
  LoginActivity.java:
  
  Perform the login operation.
  On success, use the method channel to pass user data back to Flutter.
  AndroidManifest.xml:
  
  Ensure LoginActivity is declared.

# iOS Implementation
  AppDelegate.swift:
  
  Set up a method channel in the Flutter engine.
  Handle the showLogin method to present the LoginViewController.
  LoginViewController.swift:
  
  Handle the login process and, on success, use the method channel to send user data back to Flutter.
  Main.storyboard:
  
  Design the native iOS login screen.

# Flutter Implementation
  main.dart:
  
  Display a splash screen.
  Use a method channel to invoke the native login screen.
  Listen for the login success event to navigate to HomeScreen.
  HomeScreen.dart:
  
  Display user data passed from the native side.

# Conclusion
This POC demonstrates how to effectively communicate between Flutter and native code on both Android and iOS platforms, with a real-world example of handling a login screen natively while maintaining the rest of the UI in Flutter.

