// ignore_for_file: override_on_non_overriding_member

import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';
import 'package:bankapp/app/shared/repositories/credit_card_repository.dart';
import 'package:bankapp/app/shared/repositories/criptocoin_repository.dart';
import 'package:bankapp/app/shared/repositories/firestore_repository.dart';
import 'package:bankapp/app/shared/services/auth_wrapper.dart';
import 'package:bankapp/app/shared/services/implementation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

abstract class IRegistery {
  static void setUp() {}
}

class Registery implements IRegistery {
  @override
  static void setUp() {
    final getIt = GetIt.instance;

    getIt.registerSingleton<AuthRepository>(
      AuthRepository(FirebaseAuth.instance),
    );
    getIt.registerSingleton<AuthWrapper>(
      AuthWrapper(getIt()),
    );
    getIt.registerSingleton<CriptoCoinRepository>(
      CriptoCoinRepository(Client()),
    );
    getIt.registerSingleton(FirestoreRepository(getIt()));
    getIt.registerSingleton(CreditCardRepository(getIt()));
    getIt.registerSingleton<Implementation>(Implementation(
      authRepository: getIt(),
      firestoreRepository: getIt(),
      creditCardRepository: getIt(),
    ));
  }
}
