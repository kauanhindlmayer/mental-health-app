import 'package:flutter/material.dart';
import 'package:mentalhealthapp/pages/login_page.dart';
import 'package:mentalhealthapp/pages/home_page.dart';
import 'package:mentalhealthapp/pages/registration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/register': (context) => const RegistrationPage(),
      },
    );
  }
}
