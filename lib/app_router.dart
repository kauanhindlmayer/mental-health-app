import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalhealthapp/components/splash_screen.dart';
import 'package:mentalhealthapp/pages/authentication/login_page.dart';
import 'package:mentalhealthapp/pages/authentication/sign_up_page.dart';
import 'package:mentalhealthapp/pages/consultants/consultant_formulary_page.dart';
import 'package:mentalhealthapp/pages/exercises/exercise_formulary_page.dart';
import 'package:mentalhealthapp/pages/home/home_page.dart';
import 'package:mentalhealthapp/pages/messages/messages_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => SplashScreen(
            child: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const LoginPage();
                return const HomePage();
              },
            ),
          ),
      '/sign-up': (context) => const SignUpPage(),
      '/login': (context) => const LoginPage(),
      '/home': (context) => const HomePage(),
      '/messages': (context) => const MessagesPage(),
      '/exercise-formulary': (context) => ExerciseFormularyPage(),
      '/consultant-formulary': (context) => ConsultantFormularyPage(),
    };
  }
}
