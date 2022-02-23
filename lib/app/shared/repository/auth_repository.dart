import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  User? getCurrentUser();
  Future<void> register(String email, String password);
  Future<void> login(String email, String password);
  Future<void> logout();
  Future<void> deleteAccount();
  void recoveryAccount(String email);
}

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

  @override
  User? getCurrentUser() => _auth.currentUser;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      getCurrentUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw FirebaseAuthException(
          message: 'The password is to weak',
          code: '401',
        );
      } else if (e.code == 'email-already-in-use') {
        throw FirebaseAuthException(
          message: 'Email already in use',
          code: '400',
        );
      }
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        throw FirebaseAuthException(message: 'Wrong password', code: '404');
      } else if (e.code == 'email-doesnt-exists') {
        throw FirebaseAuthException(
          message: "Email doesn't exists",
          code: '404',
        );
      }
    }
  }

  @override
  Future<void> logout() async => _auth.signOut();

  @override
  Future<void> deleteAccount() async => _auth.currentUser!.delete();

  @override
  void recoveryAccount(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }
}
