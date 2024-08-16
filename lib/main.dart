import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const platform = MethodChannel('com.example.poc_native_communication/login');
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _setupMethodChannelListener();
    _navigateToLogin();
  }

  void _setupMethodChannelListener() {
    MyApp.platform.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case 'loginSuccess':
          String userData = call.arguments;
          _handleLoginSuccess(userData);
          break;
        default:
          print("Unknown method: ${call.method}");
      }
    });
  }

  void _handleLoginSuccess(String userData) {
    if (userData.isNotEmpty) {
      try {
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(userData: userData),
          ),
        );
      } catch (e) {
        print("Navigation error: $e");
      }
    }
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2)); // Splash screen duration
    try {
      print("Navigating to Native Login");
      await MyApp.platform.invokeMethod('showLogin');
    } on PlatformException catch (e) {
      print("Failed to invoke: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget.navigatorKey,
      title: 'Flutter Native Communication POC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Splash Screen UI
        ),
      ),
    );
  }
}


