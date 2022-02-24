// ignore_for_file: override_on_non_overriding_member
import 'package:bankapp/app/shared/core/exports.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';
import 'package:bankapp/app/shared/services/auth_wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IRegistery {
  static void setUp() {}
}

class Registery implements IRegistery {
  @override
  static void setUp() {
    GetIt.I.registerSingleton<AuthRepository>(
      AuthRepository(FirebaseAuth.instance),
    );
    GetIt.I.registerSingleton<AuthWrapper>(
      AuthWrapper(GetIt.I<AuthRepository>()),
    );
  }
}
