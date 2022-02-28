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
    GetIt.I.registerSingleton<AuthRepository>(
      AuthRepository(FirebaseAuth.instance),
    );
    GetIt.I.registerSingleton<AuthWrapper>(
      AuthWrapper(GetIt.I<AuthRepository>()),
    );
    GetIt.I.registerSingleton<CriptoCoinRepository>(
      CriptoCoinRepository(Client()),
    );
    GetIt.I.registerSingleton(FirestoreRepository(GetIt.I<AuthRepository>()));
    GetIt.I.registerSingleton(CreditCardRepository(GetIt.I<AuthRepository>()));
    GetIt.I.registerSingleton<Implementation>(Implementation(
      authRepository: GetIt.I<AuthRepository>(),
      firestoreRepository: GetIt.I<FirestoreRepository>(),
      creditCardRepository: GetIt.I<CreditCardRepository>(),
    ));
  }
}
