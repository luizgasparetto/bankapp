//import 'package:bankapp/app/shared/core/exports.dart';
// ignore_for_file: unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  final String message;
  AuthException({required this.message});
}

abstract class IAuthRepository {
  Future<void> signIn();
  Future<void> signUp();
  Future<void> signOut();
  _getUser();
  resetPasswordAndEmail();
  deleteAccount();
}

class AuthRepository extends ChangeNotifier implements IAuthRepository {
  final FirebaseAuth _auth;
  User? authUser;

  String name = '';
  String email = '';
  String password = '';

  AuthRepository(this._auth) {
    _auth.authStateChanges().listen((User? user) {
      authUser = (user == null) ? null : user;
      notifyListeners();
    });
  }

  @override
  Future<void> signIn() async {
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
  Future<void> signUp() async {
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
  Future<void> signOut() async {
    await _auth.signOut();
    _getUser();
  }

  @override
  deleteAccount() async {
    await _auth.currentUser!.delete();
    _getUser();
  }

  @override
  _getUser() {
    authUser = _auth.currentUser;
    notifyListeners();
  }

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  void updateName(String value) {
    name = value;
    notifyListeners();
  }

  @override
  resetPasswordAndEmail() {
    email = '';
    password = '';
    notifyListeners();
  }
}
