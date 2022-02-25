//import 'package:bankapp/app/shared/core/exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class IAuthRepository {
  void signIn(String email, String password);
  void signUp(String email, String password);
  void signOut();
  void getUser();
}

class AuthRepository extends ChangeNotifier implements IAuthRepository {
  final FirebaseAuth _auth;
  User? authUser;

  AuthRepository(FirebaseAuth firebaseAuth) : _auth = firebaseAuth {
    _auth.authStateChanges().listen((User? user) {
      authUser = user;
      notifyListeners();
    });
  }

  @override
  void signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw FirebaseAuthException(
          message: 'No user found for that email',
          code: '404',
        );
      } else if (e.code == 'wrong-password') {
        throw FirebaseAuthException(message: 'Wrong password', code: '403');
      }
    }
  }

  @override
  void signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw FirebaseAuthException(
          message: 'Your password must be at least 6 characters long',
          code: '400',
        );
      } else if (e.code == 'email-already-in-use') {
        throw FirebaseAuthException(
          message: 'Email already in use',
          code: '409',
        );
      }
    }
  }

  @override
  void signOut() async => await _auth.signOut();

  @override
  void getUser() {
    authUser = _auth.currentUser;
    notifyListeners();
  }
}
