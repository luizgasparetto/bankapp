import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';
import 'package:bankapp/app/shared/repositories/firestore_repository.dart';

import 'dart:developer' as dev;

abstract class IImplementation {
  signIn(BuildContext context);
  signUp(BuildContext context);
  Future<void> logout(BuildContext context);
  Future<void> deleteAccount(BuildContext context);
  String timeValidator();
}

class Implementation implements IImplementation {
  @override
  Future<void> logout(BuildContext context) async {
    await GetIt.I<AuthRepository>().signOut();
    Navigator.pushReplacementNamed(context, '/login');
    await GetIt.I<AuthRepository>().resetPasswordAndEmail();
  }

  @override
  signIn(BuildContext context) async {
    final email = GetIt.I<AuthRepository>().email;
    final password = GetIt.I<AuthRepository>().password;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await GetIt.I<AuthRepository>().signIn();
        Navigator.pushReplacementNamed(context, '/home');
        await GetIt.I<AuthRepository>().resetPasswordAndEmail();
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
        ));
      }
    } else {
      dev.log('PREENCHA TODOS OS CAMPOS');
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text('Fill in all the fields'),
      // ));
    }
  }

  @override
  signUp(BuildContext context) async {
    final fullName = GetIt.I<AuthRepository>().name;
    final email = GetIt.I<AuthRepository>().email;
    final password = GetIt.I<AuthRepository>().password;

    if (fullName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      try {
        await GetIt.I<AuthRepository>().signUp();
        await GetIt.I<FirestoreRepository>().saveUser(
          fullName,
          email,
        );
        await GetIt.I<AuthRepository>().resetPasswordAndEmail();
        Navigator.pushReplacementNamed(context, '/home');
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
        ));
      }
    } else {
      dev.log('PREENCHA TODOS OS CAMPOS');
    }
  }

  Future<String?> getName() async {
    final userName = await GetIt.I<FirestoreRepository>().getName();
    return userName.split(' ')[0];
  }

  @override
  Future<void> deleteAccount(BuildContext context) async {
    await GetIt.I<FirestoreRepository>().deleteAccount();
    await GetIt.I<AuthRepository>().deleteAccount();
    Navigator.pushReplacementNamed(context, '/welcome');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Account deleted successfully'),
    ));
  }

  @override
  String timeValidator() {
    final time = DateTime.now();
    if (time.hour >= 6 && time.hour <= 12) {
      return 'Bom dia';
    } else if (time.hour > 12 && time.hour <= 18) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
  }
}
