import 'package:flutter/material.dart';
import 'package:mentalhealthapp/pages/authentication/login_page.dart';
import 'package:mentalhealthapp/pages/authentication/registration_page.dart';
import 'package:mentalhealthapp/pages/consultants/consultant_formulary_page.dart';
import 'package:mentalhealthapp/pages/exercises/exercise_formulary_page.dart';
import 'package:mentalhealthapp/pages/home/home_page.dart';
import 'package:mentalhealthapp/pages/messages/messages_page.dart';

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
