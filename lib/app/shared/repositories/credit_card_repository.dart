import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';
import 'package:bankapp/app/shared/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:developer' as dev;

abstract class ICreditCardRepository {
  Future<void> registerCreditCard(dynamic card);
}

class CreditCardRepository extends ChangeNotifier
    implements ICreditCardRepository {
  final FirebaseFirestore _db;
  final AuthRepository _auth;

  CreditCardRepository(this._auth) : _db = DBFirestore.get();

  String cardNumber = '';
  String expirationDate = '';
  String cardName = '';
  String cvvNumber = '';

  @override
  Future<void> registerCreditCard(dynamic card) async {
    try {
      await _db
          .collection('users/${_auth.authUser!.uid}/informations')
          .doc('profile')
          .update({
        'creditCards': FieldValue.arrayUnion([card]),
      });
    } catch (e, st) {
      dev.log('registerCreditCard error', error: e, stackTrace: st);
      throw AuthException(message: 'Não foi possível adicionar o cartão');
    }
  }

  void updateCardNumber(String value) {
    cardNumber = value;
    notifyListeners();
  }

  void updateExpirationDate(String value) {
    expirationDate = value;
    notifyListeners();
  }

  void updateCardName(String value) {
    cardName = value;
    notifyListeners();
  }

  void updateCvvNumber(String value) {
    cvvNumber = value;
    notifyListeners();
  }

  void resetFields() {
    cardNumber = '';
    cardName = '';
    expirationDate = '';
    cvvNumber = '';
    notifyListeners();
  }
}
