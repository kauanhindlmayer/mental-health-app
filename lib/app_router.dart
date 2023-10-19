import 'package:flutter/material.dart';
import 'package:mentalhealthapp/pages/consultant_formulary_page.dart';
import 'package:mentalhealthapp/pages/exercise_formulary_page.dart';
import 'package:mentalhealthapp/pages/home_page.dart';
import 'package:mentalhealthapp/pages/login_page.dart';
import 'package:mentalhealthapp/pages/messages_page.dart';
import 'package:mentalhealthapp/pages/registration_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/register': (context) => const RegistrationPage(),
      '/login': (context) => const LoginPage(),
      '/home': (context) => const HomePage(),
      '/messages': (context) => const MessagesPage(),
      '/exercise-formulary': (context) => ExerciseFormularyPage(),
      '/consultant-formulary': (context) => ConsultantFormularyPage(),
    };
  }
}
