import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(const EcoSiderApp());
}

class EcoSiderApp extends StatelessWidget {
  const EcoSiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoSider',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const LoginScreen(),
    );
  }
}

