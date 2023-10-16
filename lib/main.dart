import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:mentalhealthapp/pages/login_page.dart';
import 'package:mentalhealthapp/pages/home_page.dart';
import 'package:mentalhealthapp/pages/registration_page.dart';
import 'package:mentalhealthapp/pages/messages_page.dart';
import 'package:mentalhealthapp/pages/create_exercise_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/messages': (context) => const MessagesPage(),
        '/create-exercise': (context) => const CreateExercisePage(),
      },
    );
  }
}
