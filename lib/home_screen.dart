import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userData;

  const HomeScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Text('User Data: $userData'),
      ),
    );
  }
}