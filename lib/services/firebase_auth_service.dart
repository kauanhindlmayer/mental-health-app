import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithGitHub(BuildContext context) async {
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
        clientId: 'clientId',
        clientSecret: 'clientSecret',
        redirectUrl: 'https://mentalhealthapp.firebaseapp.com/__/auth/handler');

    final result = await gitHubSignIn.signIn(context);

    final githubAuthCredential = GithubAuthProvider.credential(result.token!);

    return await FirebaseAuth.instance
        .signInWithCredential(githubAuthCredential);
  }
}
