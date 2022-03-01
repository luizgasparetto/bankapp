import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';
import 'package:bankapp/app/shared/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:developer' as dev;

abstract class ICreditCardRepository {
  Future<void> registerCreditCard(dynamic card);
  Future<void> deleteCreditCard(dynamic card);
  void updateFields({
    bool cardNumber,
    bool cardName,
    bool expirationDate,
    bool cvvNumber,
    required String value,
  });
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

  @override
  Future<void> deleteCreditCard(card) async {
    try {
      await _db
          .collection('users/${_auth.authUser!.uid}/informations')
          .doc('profile')
          .update({
        'creditCards': FieldValue.arrayRemove([card]),
      });
    } catch (e) {
      throw AuthException(message: 'Não possível deletar o cartão');
    }
  }

  @override
  void updateFields({
    bool cardNumber = false,
    bool cardName = false,
    bool expirationDate = false,
    bool cvvNumber = false,
    required String value,
  }) {
    if (cardNumber) {
      this.cardNumber = value;
      notifyListeners();
      return;
    } else if (cardName) {
      this.cardName = value;
      notifyListeners();
      return;
    } else if (expirationDate) {
      this.expirationDate = value;
      notifyListeners();
      return;
    } else if (cvvNumber) {
      this.cvvNumber = value;
      notifyListeners();
      return;
    }
  }

  void resetFields() {
    cardNumber = '';
    cardName = '';
    expirationDate = '';
    cvvNumber = '';
    notifyListeners();
  }
}
