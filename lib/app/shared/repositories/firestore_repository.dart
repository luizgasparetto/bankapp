import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/shared/models/criptocoin.dart';
import 'package:bankapp/app/shared/models/extract.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';
import 'package:bankapp/app/shared/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:developer' as dev;

abstract class IFirestoreRepository {
  Future<void> saveUser(String fullName, String email);
  Future<String> getName();
  Future<void> deleteAccount();
  Future<void> getCreditCards();
  Future<void> registerCreditCard(CreditCard card);
  Future<void> getUser();
}

class FirestoreRepository extends ChangeNotifier
    implements IFirestoreRepository {
  final FirebaseFirestore _db;
  final AuthRepository _auth;

  FirestoreRepository(AuthRepository auth)
      : _db = DBFirestore.get(),
        _auth = auth;

  @override
  Future<void> saveUser(String fullName, String email) async {
    try {
      await _db
          .collection('users/${_auth.authUser!.uid}/informations')
          .doc('profile')
          .set(
        {
          'fullName': fullName,
          'email': email,
          'creditCards': <CreditCard>[],
          'statement': <Statement>[],
          'balance': 0.00,
          'toPay': 0.00,
          'favoriteCoins': <CriptoCoin>[],
        },
      );
    } catch (e) {
      dev.log('Erro ao cadastrar o user ${_auth.authUser!.uid}');
    }
  }

  @override
  Future<String> getName() async {
    try {
      final user = await _db
          .collection('users/${_auth.authUser!.uid}/informations')
          .doc('profile')
          .get();

      return user.get('fullName');
    } catch (e) {
      return 'NULL NAME';
    }
  }

  Future<String> getEmail() async {
    try {
      final user = await _db
          .collection('users/${_auth.authUser!.uid}/informations')
          .doc('profile')
          .get();

      return user.get('email');
    } catch (e) {
      return 'NULL EMAIL';
    }
  }

  @override
  Future<void> deleteAccount() async {
    await _db
        .collection('users/${_auth.authUser!.uid}/informations')
        .get()
        .then((value) {
      for (DocumentSnapshot ds in value.docs) {
        ds.reference.delete();
      }
    });
    notifyListeners();
  }

  @override
  Future<List> getCreditCards() async {
    final user = await _db
        .collection('users/${_auth.authUser!.uid}/informations')
        .doc('profile')
        .get();

    return user.get('creditCards') ?? [];
  }

  @override
  Future<void> registerCreditCard(dynamic card) async {
    await _db
        .collection('users/${_auth.authUser!.uid}/informations')
        .doc('profile')
        .update({
      'creditCards': FieldValue.arrayUnion(card),
    });
  }

  @override
  Future<DocumentSnapshot<Map>> getUser() async {
    return await _db
        .collection('users/${_auth.authUser!.uid}/informations')
        .doc('profile')
        .get();
  }
}
