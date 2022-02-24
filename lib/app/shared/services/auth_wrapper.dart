import 'package:bankapp/app/modules/views/auth/welcome_page.dart';
import 'package:bankapp/app/modules/views/home/home_page.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class IAuthWrapper {
  Widget get auth;
}

class AuthWrapper implements IAuthWrapper {
  final User? _user;

  AuthWrapper(AuthRepository authRepository) : _user = authRepository.authUser;

  @override
  Widget get auth => _user != null ? const HomePage() : const WelcomePage();
}
