import 'package:cloud_firestore/cloud_firestore.dart';

// Singleton
class DBFirestore {
  DBFirestore._();
  static final DBFirestore instance = DBFirestore._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return DBFirestore.instance._firestore;
  }
}
