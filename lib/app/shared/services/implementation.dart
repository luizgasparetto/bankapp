import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/shared/blocs/creditcards/creditcards_bloc.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';
import 'package:bankapp/app/shared/repositories/credit_card_repository.dart';
import 'package:bankapp/app/shared/repositories/firestore_repository.dart';

import 'dart:developer' as dev;

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IImplementation {
  signIn(BuildContext context);
  signUp(BuildContext context);
  Future<void> logout(BuildContext context);
  Future<void> deleteAccount(BuildContext context);
  Future<void> resetPassword(BuildContext context);
  String timeValidator();
  Future<void> registerCreditCard(BuildContext context);
  Future<void> deleteCreditCard(BuildContext context, dynamic card);
}

class Implementation implements IImplementation {
  final AuthRepository authRepository;
  final FirestoreRepository firestoreRepository;
  final CreditCardRepository creditCardRepository;

  Implementation({
    required this.authRepository,
    required this.firestoreRepository,
    required this.creditCardRepository,
  });

  @override
  Future<void> logout(BuildContext context) async {
    await authRepository.signOut();
    Navigator.pushReplacementNamed(context, '/login');
    await authRepository.resetPasswordAndEmailFields();
  }

  @override
  signIn(BuildContext context) async {
    final email = authRepository.email;
    final password = authRepository.password;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await authRepository.signIn();
        Navigator.pushReplacementNamed(context, '/home');
        await authRepository.resetPasswordAndEmailFields();
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
        ));
      }
    } else {
      dev.log('PREENCHA TODOS OS CAMPOS');
    }
  }

  @override
  signUp(BuildContext context) async {
    final fullName = authRepository.name;
    final email = authRepository.email;
    final password = authRepository.password;

    if (fullName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      try {
        await authRepository.signUp();
        await firestoreRepository.saveUser(
          fullName,
          email,
        );
        await authRepository.resetPasswordAndEmailFields();
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
    final userName = await firestoreRepository.getName();
    return userName.split(' ')[0];
  }

  @override
  Future<void> deleteAccount(BuildContext context) async {
    await firestoreRepository.deleteAccount();
    await authRepository.deleteAccount();
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

  @override
  Future<void> resetPassword(BuildContext context) async {
    final email = authRepository.email;

    if (email.isNotEmpty) {
      try {
        await authRepository.resetPassword();
        await authRepository.resetPasswordAndEmailFields();
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Email enviado com sucesso'),
        ));
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
        ));
      }
    } else {
      dev.log('PREENCHA TODOS OS CAMPOS');
    }
  }

  @override
  Future<void> registerCreditCard(BuildContext context) async {
    final cardNumber = creditCardRepository.cardNumber;
    final cardName = creditCardRepository.cardName;
    final expirationDate = creditCardRepository.expirationDate;
    final cvvCode = creditCardRepository.cvvNumber;

    if (cardNumber.isNotEmpty &&
        cardName.isNotEmpty &&
        expirationDate.isNotEmpty &&
        cvvCode.isNotEmpty) {
      try {
        final card = {
          "cardNumber": cardNumber,
          "expirationDate": expirationDate,
          "cardName": cardName,
          "cvvCode": cvvCode,
        };

        await creditCardRepository.registerCreditCard(card);
        BlocProvider.of<CreditCardsBloc>(context).add(CreditCardsFetchEvent());
        Navigator.pop(context);
        creditCardRepository.resetFields();
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } else {
      dev.log('PREENCHE TUDO KRL');
    }
  }

  @override
  Future<void> deleteCreditCard(BuildContext context, dynamic card) async {
    try {
      await creditCardRepository.deleteCreditCard(card);
      BlocProvider.of<CreditCardsBloc>(context).add(CreditCardsFetchEvent());
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cartão removido com sucesso')));
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        e.message,
      )));
    }
  }
}
