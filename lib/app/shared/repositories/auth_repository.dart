//import 'package:bankapp/app/shared/core/exports.dart';
// ignore_for_file: unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  final String message;
  AuthException({required this.message});
}

abstract class IAuthRepository {
  signIn();
  signUp();
  signOut();
  _getUser();
  void updateEmail(String value);
  void updatePassword(String value);
  resetPasswordAndEmail();
}

class AuthRepository extends ChangeNotifier implements IAuthRepository {
  final FirebaseAuth _auth;
  User? authUser;

  String email = '';
  String password = '';

  AuthRepository(this._auth) {
    _auth.authStateChanges().listen((User? user) {
      authUser = (user == null) ? null : user;
      notifyListeners();
    });
  }

  @override
  signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException(message: 'Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw AuthException(message: 'Senha incorreta. Tente novamente');
      }
    }
  }

  @override
  signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException(
          message: 'Your password must be at least 6 characters long',
        );
      } else if (e.code == 'email-already-in-use') {
        throw AuthException(message: 'Email already in use');
      }
    }
  }

  @override
  signOut() async {
    await _auth.signOut();
    _getUser();
  }

  @override
  _getUser() {
    authUser = _auth.currentUser;
    notifyListeners();
  }

  @override
  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  @override
  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  @override
  resetPasswordAndEmail() {
    email = '';
    password = '';
    notifyListeners();
  }
}
