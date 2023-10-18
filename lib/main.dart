import 'package:firebase_core/firebase_core.dart';
import 'package:mentalhealthapp/pages/exercise_formulary_page.dart';
import 'services/settings/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:mentalhealthapp/pages/login_page.dart';
import 'package:mentalhealthapp/pages/home_page.dart';
import 'package:mentalhealthapp/pages/registration_page.dart';
import 'package:mentalhealthapp/pages/messages_page.dart';

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
        '/exercise-formulary': (context) => ExerciseFormularyPage()
      },
    );
  }
}
