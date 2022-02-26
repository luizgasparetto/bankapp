import 'package:bankapp/app/modules/views/auth/welcome_page.dart';
import 'package:bankapp/app/modules/views/home/home_page.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

abstract class IAuthWrapper {
  Widget get auth;
}

class AuthWrapper implements IAuthWrapper {
  final AuthRepository authRepository;

  AuthWrapper(this.authRepository);

  @override
  Widget get auth =>
      authRepository.authUser != null ? const HomePage() : const WelcomePage();
}
